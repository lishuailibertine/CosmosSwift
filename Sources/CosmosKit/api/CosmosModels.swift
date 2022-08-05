//
//  File.swift
//  
//
//  Created by li shuai on 2022/3/23.
//

import Foundation
public enum CosmosHttpRequestError: Error{
    case Unknown
    case NodeError
    case ParamEncodeError(error:Error)
    case ResponseError(stateCode:Int)
    case OtherError(error:Error)
}
public struct CosmosCoin:Codable{
    public let amount: String
    public let denom: String
    public init(amount: String,denom: String){
        self.amount = amount
        self.denom = denom
    }
}
public struct CosmosLastBlock:Codable{
    public struct CosmosBlockId: Codable{
    }
    public struct CosmosBlock:Codable{
        public struct CosmosBlockHeader: Codable{
            public let chain_id:String
            public let height: String
        }
        public let header:CosmosBlockHeader
    }
    public let block:CosmosBlock
}
public struct CosmosBalance:Codable{
    public let balances:[CosmosCoin]
}
public struct CosmosResponseAccount:Codable{
    public struct CosmosAccountInfo:Codable{
        public let account_number: String
        public let sequence: String
    }
    public var account:CosmosAccountInfo
    public static func decode(json:Dictionary<String,Any>) -> CosmosResponseAccount{
        let account_number_key = "account_number"
        let sequence_key = "sequence"
        let account_number = json.valueFor(key: account_number_key) ?? "0"
        let sequence = json.valueFor(key: sequence_key) ?? "0"
        return CosmosResponseAccount(account: CosmosAccountInfo(account_number: account_number, sequence: sequence))
    }
}
extension Dictionary where Key == String, Value:Any{
    public func valueFor(key:String)->String?{
        if self.keys.contains(key) {
            return self[key] as? String
        }else{
            for subkey in self.keys {
                if let dic = self[subkey] as? Dictionary<String,Any> {
                    return dic.valueFor(key: key)
                }
            }
            return nil
        }
    }
}
public struct CosmosDelegationsResponse:Codable{
    public let balance:CosmosCoin
}
public struct CosmosDelegations:Codable{
    public let delegation_responses:[CosmosDelegationsResponse]
}
public struct CosmosUnbondingDelegationsResponse:Codable{
    public struct CosmosUnbondingDelegationsEntryResponse:Codable{
        public let balance:String
    }
    public let entries: [CosmosUnbondingDelegationsEntryResponse]
}
public struct CosmosStakeUnbondingDelegation:Codable{
    public let unbonding_responses:[CosmosUnbondingDelegationsResponse]
}

public struct CosmosTxResponse:Codable{
    public struct CosmosTxResponseInfo:Codable{
        public let code: UInt32
        public let txhash: String
        public let raw_log: String
    }
    public let tx_response:CosmosTxResponseInfo
}
public typealias CosmosAccountInfo = CosmosResponseAccount.CosmosAccountInfo
typealias CosmosUnbondingDelegationsEntryResponse = CosmosUnbondingDelegationsResponse.CosmosUnbondingDelegationsEntryResponse
typealias CosmosBlock = CosmosLastBlock.CosmosBlock
typealias CosmosBlockHeader = CosmosBlock.CosmosBlockHeader
