//
//  File.swift
//
//
//  Created by li shuai on 2022/3/8.
//

import Foundation
import GRPC
import SwiftProtobuf
import NIO
import CryptoSwift
import PromiseKit
import BigInt

public typealias CosmosCoin = CosmosTransaction.CosmosCoin

public struct CosmosTransaction{
    public struct CosmosCoin:Codable{
        public let amount: String
        public let denom: String
        public var gasLimit: UInt64?
        public init(amount: String,denom: String, gasLimit: UInt64? = 0){
            self.amount = "\(Int(Double(amount) ?? 0))"
            self.denom = denom
            self.gasLimit = gasLimit
        }
    }
    public let from: CosmosAddress
    public let to: CosmosAddress
    public let amount:CosmosCoin
    public var memo: String?
    public var fee: CosmosCoin
    public init(from: CosmosAddress,to: CosmosAddress,amount: CosmosCoin,memo:String? = "",fee:CosmosCoin){
        self.from = from
        self.to = to
        self.amount = amount
        self.memo = memo
        self.fee = fee
    }
    public func serializedData(wallet:CosmosKeypair) ->Promise<String> {
        return Promise { seal in
            let message = Cosmos_Bank_V1beta1_MsgSend.with {
                $0.fromAddress = from.address
                $0.toAddress = to.address
                $0.amount = [self.conversionCoin(coin: amount)]
            }
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/\(Cosmos_Bank_V1beta1_MsgSend.protoMessageName)"
                $0.value = try! message.serializedData()
            }
            let txBody = getTxBody([anyMsg], memo ?? "")
            let publicKey = wallet.publicKey
            CosmosHttpRequest.shared.getAccount(address: from.address).done { result in
                let signerInfo = getSignerInfo(publicKey: publicKey, sequence:UInt64(result.account.sequence) ?? 0)
                let authInfo = getAuthInfo(signerInfo, feeCoin: fee)
                CosmosHttpRequest.shared.getLastBlock().done { lastBlock in
                    let rawTx = try getRawTx(txBody, authInfo,accountNumber:UInt64(result.account.account_number) ?? 0 ,wallet: wallet,chainId:lastBlock.block.header.chain_id)
                    guard let serializedData = try? rawTx.serializedData()  else {
                        seal.reject(CosmosApiError.serializedDataError)
                        return
                    }
                    seal.fulfill(serializedData.bytes.toBase64())
                }.catch { error in
                    seal.reject(error)
                }
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    public func serializedData(wallet:CosmosKeypair)throws -> Data{
        let message = Cosmos_Bank_V1beta1_MsgSend.with {
            $0.fromAddress = from.address
            $0.toAddress = to.address
            $0.amount = [self.conversionCoin(coin: amount)]
        }
        
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/\(Cosmos_Bank_V1beta1_MsgSend.protoMessageName)"
            $0.value = try! message.serializedData()
        }
        let txBody = getTxBody([anyMsg], memo ?? "")
        let publicKey = wallet.publicKey
        let account = try CosmosGRPCRequest.shared.queryAccountRequest(address: from.address)
        let signerInfo = getSignerInfo(publicKey: publicKey, sequence: account.sequence)
        let authInfo = getAuthInfo(signerInfo, feeCoin: fee)
        let lastBlock = try CosmosGRPCRequest.shared.queryLatestBlock()
        
        let rawTx = try getRawTx(txBody, authInfo,accountNumber: account.accountNumber,wallet: wallet,chainId:lastBlock.block.header.chainID)
        debugPrint("txBytes: \(try! rawTx.serializedData().bytes.toBase64())")
        return try rawTx.serializedData()
    }
}
//transaction
extension CosmosTransaction{
    func getTxBody(_ msgAnys: Array<Google_Protobuf_Any>, _ memo: String) -> Cosmos_Tx_V1beta1_TxBody {
        return Cosmos_Tx_V1beta1_TxBody.with {
            $0.memo = memo
            $0.messages = msgAnys
        }
    }
    func getRawTx(_ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo,accountNumber: UInt64,wallet:CosmosKeypair,chainId:String) throws -> Cosmos_Tx_V1beta1_TxRaw {
        let bodyBytes = try txBody.serializedData()
        let authInfoBytes = try authInfo.serializedData()
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = bodyBytes
            $0.authInfoBytes = authInfoBytes
            $0.chainID = chainId
            $0.accountNumber = accountNumber
        }
        
        let sigbyte = try wallet.sign(message: try signDoc.serializedData())
        return Cosmos_Tx_V1beta1_TxRaw.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.signatures = [sigbyte]
        }
    }
    func getSignerInfo(publicKey: Data,sequence:UInt64) -> Cosmos_Tx_V1beta1_SignerInfo {
        let single = Cosmos_Tx_V1beta1_ModeInfo.Single.with {
            $0.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
        }
        let mode = Cosmos_Tx_V1beta1_ModeInfo.with {
            $0.single = single
        }
        let pub = Cosmos_Crypto_Secp256k1_PubKey.with {
            $0.key = publicKey
        }
        let pubKey = Google_Protobuf_Any.with {
            $0.typeURL = "/\(Cosmos_Crypto_Secp256k1_PubKey.protoMessageName)"
            $0.value = try! pub.serializedData()
        }
        return Cosmos_Tx_V1beta1_SignerInfo.with {
            $0.publicKey = pubKey
            $0.modeInfo = mode
            $0.sequence = sequence
        }
    }
    func getAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo,feeCoin: CosmosCoin) -> Cosmos_Tx_V1beta1_AuthInfo {
        let _feeCoin = Cosmos_Base_V1beta1_Coin.with {
            $0.denom = feeCoin.denom
            $0.amount = feeCoin.amount
        }
        let txFee = Cosmos_Tx_V1beta1_Fee.with {
            $0.amount = [_feeCoin]
            $0.gasLimit = feeCoin.gasLimit ?? 0
        }
        return Cosmos_Tx_V1beta1_AuthInfo.with {
            $0.fee = txFee
            $0.signerInfos = [signerInfo]
        }
    }
    private func conversionCoin(coin:CosmosCoin)->Cosmos_Base_V1beta1_Coin{
        return Cosmos_Base_V1beta1_Coin.with {
            $0.amount = coin.amount
            $0.denom = coin.denom
        }
    }
}
