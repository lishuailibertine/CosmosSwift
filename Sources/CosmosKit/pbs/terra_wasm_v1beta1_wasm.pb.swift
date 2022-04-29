// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: terra/wasm/v1beta1/wasm.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Params defines the parameters for the wasm module.
public struct Terra_Wasm_V1beta1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var maxContractSize: UInt64 = 0

  public var maxContractGas: UInt64 = 0

  public var maxContractMsgSize: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// CodeInfo is data for the uploaded contract WASM code
public struct Terra_Wasm_V1beta1_CodeInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// CodeID is the sequentially increasing unique identifier
  public var codeID: UInt64 = 0

  /// CodeHash is the unique identifier created by wasmvm
  public var codeHash: Data = Data()

  /// Creator address who initially stored the code
  public var creator: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// ContractInfo stores a WASM contract instance
public struct Terra_Wasm_V1beta1_ContractInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Address is the address of the contract
  public var address: String = String()

  /// Creator is the contract creator address
  public var creator: String = String()

  /// Admin is who can execute the contract migration
  public var admin: String = String()

  /// CodeID is the reference to the stored Wasm code
  public var codeID: UInt64 = 0

  /// InitMsg is the raw message used when instantiating a contract
  public var initMsg: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Terra_Wasm_V1beta1_Params: @unchecked Sendable {}
extension Terra_Wasm_V1beta1_CodeInfo: @unchecked Sendable {}
extension Terra_Wasm_V1beta1_ContractInfo: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "terra.wasm.v1beta1"

extension Terra_Wasm_V1beta1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Params"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_contract_size"),
    2: .standard(proto: "max_contract_gas"),
    3: .standard(proto: "max_contract_msg_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.maxContractSize) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.maxContractGas) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.maxContractMsgSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxContractSize != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxContractSize, fieldNumber: 1)
    }
    if self.maxContractGas != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxContractGas, fieldNumber: 2)
    }
    if self.maxContractMsgSize != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxContractMsgSize, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Terra_Wasm_V1beta1_Params, rhs: Terra_Wasm_V1beta1_Params) -> Bool {
    if lhs.maxContractSize != rhs.maxContractSize {return false}
    if lhs.maxContractGas != rhs.maxContractGas {return false}
    if lhs.maxContractMsgSize != rhs.maxContractMsgSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Terra_Wasm_V1beta1_CodeInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CodeInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "code_id"),
    2: .standard(proto: "code_hash"),
    3: .same(proto: "creator"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.codeHash) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 1)
    }
    if !self.codeHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.codeHash, fieldNumber: 2)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Terra_Wasm_V1beta1_CodeInfo, rhs: Terra_Wasm_V1beta1_CodeInfo) -> Bool {
    if lhs.codeID != rhs.codeID {return false}
    if lhs.codeHash != rhs.codeHash {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Terra_Wasm_V1beta1_ContractInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ContractInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .same(proto: "creator"),
    3: .same(proto: "admin"),
    4: .standard(proto: "code_id"),
    5: .standard(proto: "init_msg"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.admin) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 5: try { try decoder.decodeSingularBytesField(value: &self.initMsg) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 2)
    }
    if !self.admin.isEmpty {
      try visitor.visitSingularStringField(value: self.admin, fieldNumber: 3)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 4)
    }
    if !self.initMsg.isEmpty {
      try visitor.visitSingularBytesField(value: self.initMsg, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Terra_Wasm_V1beta1_ContractInfo, rhs: Terra_Wasm_V1beta1_ContractInfo) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs.admin != rhs.admin {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs.initMsg != rhs.initMsg {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
