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
        self.amount = "\(Int(Double(amount) ?? 0))"
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
    public let account:CosmosAccountInfo
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
