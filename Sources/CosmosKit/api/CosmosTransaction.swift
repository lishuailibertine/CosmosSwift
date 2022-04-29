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
public struct CosmosTransaction{
    
    public var memo: String = ""
    public var sequence: UInt64 = 0
    public var accountNumber: UInt64 = 0
    public var feeCoin: CosmosCoin = CosmosCoin(amount: "0", denom: "uatom")
    public var gasLimit:UInt64 = 0
    public var signerPublicKey: Data = Data()
    public var chainId:String = "cosmoshub-4"
    private var messages:[Google_Protobuf_Any] = []
    public init(){}
    /// buildMsgs
    /// - Parameter msgs: [Dictionary<typeURL,value>]
    /// - Returns:
    public mutating func buildMsgs(msgs:Dictionary<String,Message>) throws{
        var anyMsgs = [Google_Protobuf_Any]()
        for (typeURL, message) in msgs {
            let value = try message.serializedData()
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = typeURL
                $0.value = value
            }
            anyMsgs.append(anyMsg)
        }
        self.messages = anyMsgs
    }
    public func sign(keypair:CosmosKeypair)throws ->String{
        let txBody = Cosmos_Tx_V1beta1_TxBody.with {
            $0.memo = memo
            $0.messages = messages
        }
        let signerInfo = try getSignerInfo(publicKey: signerPublicKey, sequence:sequence)
        let authInfo = getAuthInfo(signerInfo, feeCoin: feeCoin ,gasLimit: gasLimit)
        let rawTx = try signRawTx(txBody, authInfo, accountNumber: accountNumber, chainId: chainId, keypair: keypair)
        let serializedData = try rawTx.serializedData()
        return serializedData.bytes.toBase64()
    }
    
    public func signRawTx(bodyBytes: Data, authInfoBytes: Data,accountNumber: UInt64,chainId:String,keypair:CosmosKeypair) throws -> Cosmos_Tx_V1beta1_TxRaw{
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = bodyBytes
            $0.authInfoBytes = authInfoBytes
            $0.chainID = chainId
            $0.accountNumber = accountNumber
        }
        let sigbyte = try keypair.sign(message: try signDoc.serializedData())
        return Cosmos_Tx_V1beta1_TxRaw.with {
            $0.bodyBytes = bodyBytes
            $0.authInfoBytes = authInfoBytes
            $0.signatures = [sigbyte]
        }
    }
    
    private func signRawTx(_ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo,accountNumber: UInt64,chainId:String,keypair:CosmosKeypair) throws -> Cosmos_Tx_V1beta1_TxRaw {
        let bodyBytes = try txBody.serializedData()
        let authInfoBytes = try authInfo.serializedData()
        return try signRawTx(bodyBytes: bodyBytes, authInfoBytes: authInfoBytes, accountNumber: accountNumber, chainId: chainId, keypair: keypair)
    }
    private func getSignerInfo(publicKey: Data,sequence:UInt64) throws -> Cosmos_Tx_V1beta1_SignerInfo {
        let single = Cosmos_Tx_V1beta1_ModeInfo.Single.with {
            $0.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
        }
        let mode = Cosmos_Tx_V1beta1_ModeInfo.with {
            $0.single = single
        }
        let pub = Cosmos_Crypto_Secp256k1_PubKey.with {
            $0.key = publicKey
        }
        let value = try pub.serializedData()
        let pubKey = Google_Protobuf_Any.with {
            $0.typeURL = "/\(Cosmos_Crypto_Secp256k1_PubKey.protoMessageName)"
            $0.value = value
        }
        return Cosmos_Tx_V1beta1_SignerInfo.with {
            $0.publicKey = pubKey
            $0.modeInfo = mode
            $0.sequence = sequence
        }
    }
    private func getAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo,feeCoin: CosmosCoin,gasLimit:UInt64) -> Cosmos_Tx_V1beta1_AuthInfo {
        let _feeCoin = Cosmos_Base_V1beta1_Coin.with {
            $0.denom = feeCoin.denom
            $0.amount = feeCoin.amount
        }
        let txFee = Cosmos_Tx_V1beta1_Fee.with {
            $0.amount = [_feeCoin]
            $0.gasLimit = gasLimit
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

