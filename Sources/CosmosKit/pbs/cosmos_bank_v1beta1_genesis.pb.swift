// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/bank/v1beta1/genesis.proto
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

/// GenesisState defines the bank module's genesis state.
struct Cosmos_Bank_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params defines all the paramaters of the module.
  var params: Cosmos_Bank_V1beta1_Params {
    get {return _params ?? Cosmos_Bank_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  /// balances is an array containing the balances of all the accounts.
  var balances: [Cosmos_Bank_V1beta1_Balance] = []

  /// supply represents the total supply. If it is left empty, then supply will be calculated based on the provided
  /// balances. Otherwise, it will be used to validate that the sum of the balances equals this amount.
  var supply: [Cosmos_Base_V1beta1_Coin] = []

  /// denom_metadata defines the metadata of the differents coins.
  var denomMetadata: [Cosmos_Bank_V1beta1_Metadata] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Cosmos_Bank_V1beta1_Params? = nil
}

/// Balance defines an account address and balance pair used in the bank module's
/// genesis state.
struct Cosmos_Bank_V1beta1_Balance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// address is the address of the balance holder.
  var address: String = String()

  /// coins defines the different coins this balance holds.
  var coins: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Bank_V1beta1_GenesisState: @unchecked Sendable {}
extension Cosmos_Bank_V1beta1_Balance: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.bank.v1beta1"

extension Cosmos_Bank_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .same(proto: "balances"),
    3: .same(proto: "supply"),
    4: .standard(proto: "denom_metadata"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.balances) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.supply) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.denomMetadata) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.balances.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.balances, fieldNumber: 2)
    }
    if !self.supply.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.supply, fieldNumber: 3)
    }
    if !self.denomMetadata.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.denomMetadata, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Bank_V1beta1_GenesisState, rhs: Cosmos_Bank_V1beta1_GenesisState) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.balances != rhs.balances {return false}
    if lhs.supply != rhs.supply {return false}
    if lhs.denomMetadata != rhs.denomMetadata {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Bank_V1beta1_Balance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Balance"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .same(proto: "coins"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.coins) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if !self.coins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.coins, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Bank_V1beta1_Balance, rhs: Cosmos_Bank_V1beta1_Balance) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.coins != rhs.coins {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
