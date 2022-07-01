//
//  File.swift
//  
//
//  Created by li shuai on 2022/3/8.
//

import Foundation
import Secp256k1Swift
import CryptoSwift
import BIP32Swift
import Bech32

public struct CosmosAddress{
    public let address: String
    public let hrp:String
    public let publicKeyHash:Data
    
    public init(address:String,hrp:String)throws{
        self.address = address
        guard let publicKeyHash = try? CosmosAddress.decodeAddress(address: address,hrp: hrp) else {
            throw  CosmosApiError.getAddressError
        }
        self.publicKeyHash = publicKeyHash
        self.hrp = hrp
    }
    
    public init(publicKeyHash:Data,hrp:String)throws{
        self.address = try SegwitAddrCoder().defaultEncode(hrp: hrp, program: publicKeyHash)
        self.publicKeyHash = publicKeyHash
        self.hrp = hrp
    }
    public init(publicKey:Data,hrp:String)throws{
        guard let hash = publicKey.hash160() else {
            throw CosmosApiError.getAddressError
        }
       try self.init(publicKeyHash: hash, hrp: hrp)
    }
    public static func validAddress(address:String,hrp:String) -> Bool{
        guard let _ = try? self.decodeAddress(address: address, hrp: hrp) else {
            return false
        }
        return true
    }
    public static func decodeAddress(address:String,hrp:String) throws ->Data{
        return try SegwitAddrCoder().defaultDecode(hrp: hrp, addr: address)
    }
}

public struct CosmosKeypair{
    public var publicKey: Data
    public let privateKey: Data
    //
    public init(privateKey:Data)throws{
        guard let publicKey = SECP256K1.privateToPublic(privateKey: privateKey, compressed: true) else {
            throw CosmosApiError.getPublicKeyError
        }
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    public func sign(message:Data) throws ->Data{
        let hash = message.sha256()
        let signedData = SECP256K1.signForRecovery(hash: hash, privateKey: privateKey)
        guard let signData = signedData.serializedSignature?.subdata(in: 0..<64) else {
            throw CosmosApiError.signError
        }
        return signData
    }
}
public extension Data {
    func hash160() -> Data? {
        return try? RIPEMD160.hash(message: self.sha256())
    }
}
