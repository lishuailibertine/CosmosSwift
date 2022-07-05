//
//  File.swift
//  
//
//  Created by li shuai on 2022/7/5.
//

import Foundation
import CryptoSwift
import SwiftProtobuf

public protocol CosmosHumanDecodable:Message {
    func toHuman() throws -> [String: Any]
}

extension Cosmos_Base_V1beta1_Coin: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "denom": denom,
            "amount": amount
        ]
    }
}

extension Cosmos_Bank_V1beta1_MsgSend: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "fromAddress": fromAddress,
            "toAddress": toAddress,
            "amount": try amount.map({ try $0.toHuman() })
        ]
    }
}

extension Cosmos_Bank_V1beta1_Input: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "address":address,
            "coins": try coins.map({ try $0.toHuman()})
        ]
    }
}

extension Cosmos_Bank_V1beta1_Output: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "address":address,
            "coins": try coins.map({ try $0.toHuman()})
        ]
    }
}

extension Cosmos_Bank_V1beta1_MsgMultiSend: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "inputs": try inputs.map({try $0.toHuman()}),
            "outputs": try outputs.map({try $0.toHuman()})
        ]
    }
}

extension Cosmos_Staking_V1beta1_MsgDelegate: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "delegatorAddress": delegatorAddress,
            "validatorAddress": validatorAddress,
            "amount":try amount.toHuman()
        ]
    }
}

extension Cosmos_Staking_V1beta1_MsgBeginRedelegate: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "delegatorAddress": delegatorAddress,
            "validatorSrcAddress": validatorSrcAddress,
            "validatorDstAddress": validatorDstAddress,
            "amount":try amount.toHuman()
        ]
    }
}

extension Cosmos_Staking_V1beta1_Description: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "moniker": moniker,
            "identity": identity,
            "website":website,
            "securityContact":securityContact,
            "details":details
        ]
    }
}

extension Cosmos_Staking_V1beta1_CommissionRates: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "rate": rate,
            "maxRate": maxRate,
            "maxChangeRate":maxChangeRate
        ]
    }
}

extension Cosmos_Staking_V1beta1_MsgCreateValidator: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "description_p": try description_p.toHuman(),
            "commission": try commission.toHuman(),
            "minSelfDelegation": minSelfDelegation,
            "delegatorAddress": delegatorAddress,
            "validatorAddress": validatorAddress,
            "pubkey": pubkey.value.toHexString(),
            "value": try value.toHuman()
        ]
    }
}

extension Cosmos_Staking_V1beta1_MsgEditValidator: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "description_p": try description_p.toHuman(),
            "validatorAddress": validatorAddress,
            "commissionRate": commissionRate,
            "minSelfDelegation": minSelfDelegation
        ]
    }
}

extension Cosmos_Staking_V1beta1_MsgUndelegate: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "delegatorAddress": delegatorAddress,
            "validatorAddress": validatorAddress,
            "amount": try amount.toHuman()
        ]
    }
}

extension Cosmos_Distribution_V1beta1_MsgFundCommunityPool: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "amount": try amount.map({try $0.toHuman()}),
            "depositor": depositor
        ]
    }
}

extension Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "delegatorAddress": delegatorAddress,
            "withdrawAddress": withdrawAddress
        ]
    }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "delegatorAddress": delegatorAddress,
            "validatorAddress": validatorAddress
        ]
    }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "validatorAddress": validatorAddress
        ]
    }
}

extension Cosmos_Gov_V1beta1_MsgSubmitProposal: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "content": content.value.toHexString(),
            "initialDeposit": try initialDeposit.map({try $0.toHuman()}),
            "proposer": proposer
        ]
    }
}

extension Cosmos_Gov_V1beta1_MsgVote: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "proposalID": "\(proposalID)",
            "voter": voter,
            "option": "\(option.rawValue)"
        ]
    }
}
extension Cosmos_Gov_V1beta1_WeightedVoteOption: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "option": "\(option.rawValue)",
            "weight": weight
        ]
    }
}
extension Cosmos_Gov_V1beta1_MsgVoteWeighted: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "proposalID": "\(proposalID)",
            "voter": voter,
            "options": try options.map({try $0.toHuman()})
        ]
    }
}

extension Cosmos_Gov_V1beta1_MsgDeposit: CosmosHumanDecodable {
    public func toHuman() throws -> [String : Any] {
        return [
            "proposalID": "\(proposalID)",
            "depositor": depositor,
            "amount": try amount.map({try $0.toHuman()})
        ]
    }
}
