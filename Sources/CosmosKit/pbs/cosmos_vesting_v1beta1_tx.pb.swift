// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/vesting/v1beta1/tx.proto
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

/// MsgCreateVestingAccount defines a message that enables creating a vesting
/// account.
struct Cosmos_Vesting_V1beta1_MsgCreateVestingAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var fromAddress: String = String()

  var toAddress: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var endTime: Int64 = 0

  var delayed: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateVestingAccountResponse defines the Msg/CreateVestingAccount response type.
struct Cosmos_Vesting_V1beta1_MsgCreateVestingAccountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePermanentLockedAccount defines a message that enables creating a permanent
/// locked account.
struct Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var fromAddress: String = String()

  var toAddress: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePermanentLockedAccountResponse defines the Msg/CreatePermanentLockedAccount response type.
struct Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateVestingAccount defines a message that enables creating a vesting
/// account.
struct Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var fromAddress: String = String()

  var toAddress: String = String()

  var startTime: Int64 = 0

  var vestingPeriods: [Cosmos_Vesting_V1beta1_Period] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateVestingAccountResponse defines the Msg/CreatePeriodicVestingAccount
/// response type.
struct Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Vesting_V1beta1_MsgCreateVestingAccount: @unchecked Sendable {}
extension Cosmos_Vesting_V1beta1_MsgCreateVestingAccountResponse: @unchecked Sendable {}
extension Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccount: @unchecked Sendable {}
extension Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccountResponse: @unchecked Sendable {}
extension Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccount: @unchecked Sendable {}
extension Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccountResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.vesting.v1beta1"

extension Cosmos_Vesting_V1beta1_MsgCreateVestingAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateVestingAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "from_address"),
    2: .standard(proto: "to_address"),
    3: .same(proto: "amount"),
    4: .standard(proto: "end_time"),
    5: .same(proto: "delayed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fromAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.toAddress) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.endTime) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.delayed) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fromAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fromAddress, fieldNumber: 1)
    }
    if !self.toAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.toAddress, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    if self.endTime != 0 {
      try visitor.visitSingularInt64Field(value: self.endTime, fieldNumber: 4)
    }
    if self.delayed != false {
      try visitor.visitSingularBoolField(value: self.delayed, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreateVestingAccount, rhs: Cosmos_Vesting_V1beta1_MsgCreateVestingAccount) -> Bool {
    if lhs.fromAddress != rhs.fromAddress {return false}
    if lhs.toAddress != rhs.toAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.endTime != rhs.endTime {return false}
    if lhs.delayed != rhs.delayed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Vesting_V1beta1_MsgCreateVestingAccountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateVestingAccountResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreateVestingAccountResponse, rhs: Cosmos_Vesting_V1beta1_MsgCreateVestingAccountResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePermanentLockedAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "from_address"),
    2: .standard(proto: "to_address"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fromAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.toAddress) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fromAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fromAddress, fieldNumber: 1)
    }
    if !self.toAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.toAddress, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccount, rhs: Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccount) -> Bool {
    if lhs.fromAddress != rhs.fromAddress {return false}
    if lhs.toAddress != rhs.toAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePermanentLockedAccountResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccountResponse, rhs: Cosmos_Vesting_V1beta1_MsgCreatePermanentLockedAccountResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePeriodicVestingAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "from_address"),
    2: .standard(proto: "to_address"),
    3: .standard(proto: "start_time"),
    4: .standard(proto: "vesting_periods"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fromAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.toAddress) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.startTime) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.vestingPeriods) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fromAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fromAddress, fieldNumber: 1)
    }
    if !self.toAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.toAddress, fieldNumber: 2)
    }
    if self.startTime != 0 {
      try visitor.visitSingularInt64Field(value: self.startTime, fieldNumber: 3)
    }
    if !self.vestingPeriods.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.vestingPeriods, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccount, rhs: Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccount) -> Bool {
    if lhs.fromAddress != rhs.fromAddress {return false}
    if lhs.toAddress != rhs.toAddress {return false}
    if lhs.startTime != rhs.startTime {return false}
    if lhs.vestingPeriods != rhs.vestingPeriods {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePeriodicVestingAccountResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccountResponse, rhs: Cosmos_Vesting_V1beta1_MsgCreatePeriodicVestingAccountResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
