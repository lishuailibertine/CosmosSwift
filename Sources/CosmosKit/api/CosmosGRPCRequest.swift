//
//  File.swift
//
//
//  Created by li shuai on 2022/3/8.
//

import Foundation
import GRPC
import NIO
import PromiseKit
import CryptoSwift
public struct CosmosGRPCRequest{
    public var host:String
    public var port:Int
    public static let shared = CosmosGRPCRequest()
    public init(host:String = "cosmosgrpc.maiziqianbao.net",port:Int = 80){
        self.host = host
        self.port = port
    }
    public mutating func configRequest(urlStr:String)throws{
        guard let url = URL(string: urlStr) else {
            throw CosmosApiError.configRequestError
        }
        guard let _host = url.host,let _port = url.port else {
            throw CosmosApiError.configRequestError
        }
        self.host = _host
        self.port = _port
    }
    public func channel(group:EventLoopGroup)->GRPCChannel{
        let channel = ClientConnection.insecure(group: group).connect(host: host, port: port)
        return channel
    }
    public func getBlockHeight() -> Promise<Int64>{
        return Promise { seal in
            do {
                seal.fulfill(try queryLatestBlock().block.header.height)
            } catch let error {
                seal.reject(error)
            }
        }
    }
    public func getLastBlock()->Promise<CosmosLastBlock>{
        return Promise { seal in
            do {
                let lastBlock = try queryLatestBlock()
                seal.fulfill(CosmosLastBlock(block: CosmosBlock(header: CosmosBlockHeader(chain_id:lastBlock.block.header.chainID, height: "\(lastBlock.block.header.height)"))))
            } catch let error {
                seal.reject(error)
            }
        }
    }
    public func getAccount(address:String)->Promise<CosmosResponseAccount>{
        return Promise { seal in
            do {
                let account = try queryAccountRequest(address: address)
                seal.fulfill(CosmosResponseAccount(account:CosmosAccountInfo(account_number:"\(account.accountNumber)", sequence: "\(account.sequence)")))
            } catch let error {
                seal.reject(error)
            }
        }
    }
    public func getBalance(address:String) ->Promise<[CosmosCoin]>{
        return Promise { seal in
            do {
                let balancesResponse = try queryBalancesRequest(address: address)
                seal.fulfill(balancesResponse.balances.map({CosmosCoin(amount: $0.amount, denom: $0.denom)}))
            } catch let error {
                seal.reject(error)
            }
        }
    }
    public func getDelegations(address:String)->Promise<[CosmosDelegationsResponse]>{
        return Promise { seal in
            do {
                let balancesResponse = try queryDelegationsRequest(address: address)
                let balances = balancesResponse.delegationResponses.map {
                    CosmosDelegationsResponse(balance:CosmosCoin(amount: $0.balance.amount, denom: $0.balance.denom))
                }
                seal.fulfill(balances)
            } catch let error {
                seal.reject(error)
            }
        }
    }
    public func getDelegators(address:String)->Promise<[CosmosUnbondingDelegationsResponse]>{
        return Promise { seal in
            do {
                let balancesResponse = try queryUnbondingDelegationsRequest(address: address)
                let balances = balancesResponse.unbondingResponses.map {
                    CosmosUnbondingDelegationsResponse(entries: $0.entries.map({CosmosUnbondingDelegationsEntryResponse(balance:$0.balance)}))
                }
                seal.fulfill(balances)
            } catch let error {
                seal.reject(error)
            }
        }
    }
    //send
    public func sendTX(tx:ComosTxRequest) -> Promise<CosmosTxResponse>{
        return Promise { seal in
            do {
                let txData = Array(base64: tx.tx_bytes)
                let response = try pushTx(tx:Data(bytes: txData, count: txData.count),model: tx.mode).txResponse
                seal.fulfill(CosmosTxResponse(tx_response: CosmosTxResponse.CosmosTxResponseInfo(code: response.code, txhash:response.txhash, raw_log: response.rawLog)))
            } catch let error {
                seal.reject(error)
            }
        }
    }
}
extension CosmosGRPCRequest{
    func queryAccountRequest(address:String) throws -> Cosmos_Auth_V1beta1_BaseAccount{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let accountReq = Cosmos_Auth_V1beta1_QueryAccountRequest.with {
            $0.address = address
        }
        let authResponse = try Cosmos_Auth_V1beta1_QueryClient(channel: self.channel(group: eventLoop)).account(accountReq).response.wait()
        return try Cosmos_Auth_V1beta1_BaseAccount(serializedData: authResponse.account.value)
    }
    func queryLatestBlock()throws -> Cosmos_Base_Tendermint_V1beta1_GetLatestBlockResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let getLatestBlockRequest = Cosmos_Base_Tendermint_V1beta1_GetLatestBlockRequest.with {_ in }
        return try Cosmos_Base_Tendermint_V1beta1_ServiceClient(channel: self.channel(group: eventLoop)).getLatestBlock(getLatestBlockRequest).response.wait()
    }
    func queryBalanceRequest(address:String,denom:String)throws -> Cosmos_Bank_V1beta1_QueryBalanceResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let queryBalanceRequest =  Cosmos_Bank_V1beta1_QueryBalanceRequest.with {
            $0.address = address
            $0.denom = denom
        }
        return try Cosmos_Bank_V1beta1_QueryClient(channel: self.channel(group: eventLoop)).balance(queryBalanceRequest).response.wait()
    }
    func queryBalancesRequest(address:String)throws -> Cosmos_Bank_V1beta1_QueryAllBalancesResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let queryBalancesRequest = Cosmos_Bank_V1beta1_QueryAllBalancesRequest.with {
            $0.address = address
        }
        return try Cosmos_Bank_V1beta1_QueryClient(channel: self.channel(group: eventLoop)).allBalances(queryBalancesRequest).response.wait()
    }
    func queryDelegationsRequest(address:String)throws->Cosmos_Staking_V1beta1_QueryDelegatorDelegationsResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let queryDelegatorDelegationsRequest = Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest.with {
            $0.delegatorAddr = address
        }
        return try Cosmos_Staking_V1beta1_QueryClient(channel:  self.channel(group: eventLoop)).delegatorDelegations(queryDelegatorDelegationsRequest).response.wait()
    }
    func queryUnbondingDelegationsRequest(address:String)throws->Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let queryUnbondingDelegatorDelegationsRequest = Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest.with {
            $0.delegatorAddr = address
        }
        return try Cosmos_Staking_V1beta1_QueryClient(channel:  self.channel(group: eventLoop)).delegatorUnbondingDelegations(queryUnbondingDelegatorDelegationsRequest).response.wait()
    }
    func pushTx(tx:Data,model:ComosTxRequest.CosmosTxModel)throws -> Cosmos_Tx_V1beta1_BroadcastTxResponse{
        let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 5)
        defer {
            do {
                try eventLoop.syncShutdownGracefully()
            } catch let error {
                print(error)
            }
        }
        let txReq = Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
            $0.mode = model == .async ? .async : .sync
            $0.txBytes = tx
        }
        return try Cosmos_Tx_V1beta1_ServiceClient(channel: self.channel(group: eventLoop)).broadcastTx(txReq).response.wait()
    }
}
