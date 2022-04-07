//
//  File.swift
//
//
//  Created by li shuai on 2022/3/9.
//

import Foundation

public enum CosmosApiError: Error{
    case unknow
    case getPublicKeyError
    case signError
    case getAddressError
    case createAddressError
    case serializedDataError
    case createWalletError
    case configRequestError
}
