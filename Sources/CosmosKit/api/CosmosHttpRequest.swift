//
//  File.swift
//  
//
//  Created by li shuai on 2022/3/22.
//

import Foundation
import PromiseKit
import Alamofire

public enum CosmosRequestPath: String{
    case Bank_V1beta1_Balances = "/cosmos/bank/v1beta1/balances/%@"
    case Auth_V1beta1_Accounts = "/cosmos/auth/v1beta1/accounts/%@"
    case Staking_V1beta1_Delegations = "/cosmos/staking/v1beta1/delegations/%@"
    case Staking_V1beta1_Delegators = "/cosmos/staking/v1beta1/delegators/%@/unbonding_delegations"
    case Blocks_Latest = "/blocks/latest"
    case Tx_V1beta1_Txs = "/cosmos/tx/v1beta1/txs"
}
public typealias CosmosTxModel = ComosTxRequest.CosmosTxModel
public struct ComosTxRequest:Codable{
    public enum CosmosTxModel:String,Codable{
        case sync = "BROADCAST_MODE_SYNC"
        case async = "BROADCAST_MODE_ASYNC"
    }
    public let tx_bytes: String
    public let mode:CosmosTxModel
    public init(tx_bytes:String,model:CosmosTxModel){
        self.tx_bytes = tx_bytes
        self.mode = model
    }
}
enum CosmosTransactionError: Error {
    case sendError(message:String)
}

extension CosmosTransactionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .sendError(let message):
            return message
        }
    }
}
public struct CosmosHttpRequest{
    public var url: String
    public static let shared = CosmosHttpRequest()
    public init(url: String = "https://api.cosmos.network"){
        self.url = url
    }
    private var headers: HTTPHeaders {
        ["Content-type": "application/json"]
    }
    public func getAccount(address:String)->Promise<CosmosResponseAccount>{
        return Promise { seal in
            sendRequest(method: .get, path: String(format: CosmosRequestPath.Auth_V1beta1_Accounts.rawValue, address), param: nil).done {(result:CosmosResponseAccount)
                in
                seal.fulfill(result)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func getBlockHeight() -> Promise<Int64>{
        return Promise { seal in
            sendRequest(method: .get, path: CosmosRequestPath.Blocks_Latest.rawValue, param: nil).done { (result: CosmosLastBlock) in
                seal.fulfill(Int64(result.block.header.height) ?? 0)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func getLastBlock()->Promise<CosmosLastBlock>{
        return Promise { seal in
            sendRequest(method: .get, path: CosmosRequestPath.Blocks_Latest.rawValue, param: nil).done { (result: CosmosLastBlock) in
                seal.fulfill(result)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func getBalance(address:String) ->Promise<[CosmosCoin]>{
        return Promise { seal in
            sendRequest(method: .get, path: String(format: CosmosRequestPath.Bank_V1beta1_Balances.rawValue, address), param: nil).done { (result: CosmosBalance) in
                seal.fulfill(result.balances)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func getDelegations(address:String)->Promise<[CosmosDelegationsResponse]>{
        return Promise { seal in
            sendRequest(method: .get, path: String(format: CosmosRequestPath.Staking_V1beta1_Delegations.rawValue, address), param: nil).done { (result: CosmosDelegations)
                in
                seal.fulfill(result.delegation_responses)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func getDelegators(address:String)->Promise<[CosmosUnbondingDelegationsResponse]>{
        return Promise { seal in
            sendRequest(method: .get, path: String(format: CosmosRequestPath.Staking_V1beta1_Delegators.rawValue, address), param: nil).done { (result: CosmosStakeUnbondingDelegation)
                in
                seal.fulfill(result.unbonding_responses)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
   
    public func sendTX(tx:ComosTxRequest) -> Promise<CosmosTxResponse>{
        return Promise { seal in
            do {
                let txData = try JSONEncoder().encode(tx)
                let txDic = try JSONSerialization.jsonObject(with: txData) as! Dictionary<String,String>
                sendRequest(method: .post, path: CosmosRequestPath.Tx_V1beta1_Txs.rawValue, param: txDic,encoder: JSONParameterEncoder.prettyPrinted ).done {(result: CosmosTxResponse)
                    in
                    if result.tx_response.code == 0{
                        seal.fulfill(result)
                    }else{
                        seal.reject(CosmosTransactionError.sendError(message: result.tx_response.raw_log))
                    }
                    seal.fulfill(result)
                }.catch { error in
                    seal.reject(error)
                }
            } catch let error {
                seal.reject(error)
            }
        }
    }
    private func sendRequest<T:Codable>(method:HTTPMethod,path:String,param:Dictionary<String,String>?,encoder:ParameterEncoder = URLEncodedFormParameterEncoder.default )->Promise<T>{
        return  Promise { seal in
            AF.request("\(url)\(path)", method: method, parameters: param, encoder: encoder, headers:nil).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        seal.fulfill(result)
                    } catch let e {
                        seal.reject(e)
                    }
                case .failure(let e):
                    seal.reject(e)
                }
            }
        }
    }
}
