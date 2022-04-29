// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/feegrant/v1beta1/feegrant.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Since: cosmos-sdk 0.43

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

/// BasicAllowance implements Allowance with a one-time grant of tokens
/// that optionally expires. The grantee can use up to SpendLimit to cover fees.
public struct Cosmos_Feegrant_V1beta1_BasicAllowance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// spend_limit specifies the maximum amount of tokens that can be spent
  /// by this allowance and will be updated as tokens are spent. If it is
  /// empty, there is no spend limit and any amount of coins can be spent.
  public var spendLimit: [Cosmos_Base_V1beta1_Coin] = []

  /// expiration specifies an optional time when this allowance expires
  public var expiration: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expiration ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expiration = newValue}
  }
  /// Returns true if `expiration` has been explicitly set.
  public var hasExpiration: Bool {return self._expiration != nil}
  /// Clears the value of `expiration`. Subsequent reads from it will return its default value.
  public mutating func clearExpiration() {self._expiration = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _expiration: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// PeriodicAllowance extends Allowance to allow for both a maximum cap,
/// as well as a limit per time period.
public struct Cosmos_Feegrant_V1beta1_PeriodicAllowance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// basic specifies a struct of `BasicAllowance`
  public var basic: Cosmos_Feegrant_V1beta1_BasicAllowance {
    get {return _basic ?? Cosmos_Feegrant_V1beta1_BasicAllowance()}
    set {_basic = newValue}
  }
  /// Returns true if `basic` has been explicitly set.
  public var hasBasic: Bool {return self._basic != nil}
  /// Clears the value of `basic`. Subsequent reads from it will return its default value.
  public mutating func clearBasic() {self._basic = nil}

  /// period specifies the time duration in which period_spend_limit coins can
  /// be spent before that allowance is reset
  public var period: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _period ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_period = newValue}
  }
  /// Returns true if `period` has been explicitly set.
  public var hasPeriod: Bool {return self._period != nil}
  /// Clears the value of `period`. Subsequent reads from it will return its default value.
  public mutating func clearPeriod() {self._period = nil}

  /// period_spend_limit specifies the maximum number of coins that can be spent
  /// in the period
  public var periodSpendLimit: [Cosmos_Base_V1beta1_Coin] = []

  /// period_can_spend is the number of coins left to be spent before the period_reset time
  public var periodCanSpend: [Cosmos_Base_V1beta1_Coin] = []

  /// period_reset is the time at which this period resets and a new one begins,
  /// it is calculated from the start time of the first transaction after the
  /// last period ended
  public var periodReset: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _periodReset ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_periodReset = newValue}
  }
  /// Returns true if `periodReset` has been explicitly set.
  public var hasPeriodReset: Bool {return self._periodReset != nil}
  /// Clears the value of `periodReset`. Subsequent reads from it will return its default value.
  public mutating func clearPeriodReset() {self._periodReset = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _basic: Cosmos_Feegrant_V1beta1_BasicAllowance? = nil
  fileprivate var _period: SwiftProtobuf.Google_Protobuf_Duration? = nil
  fileprivate var _periodReset: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// AllowedMsgAllowance creates allowance only for specified message types.
public struct Cosmos_Feegrant_V1beta1_AllowedMsgAllowance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// allowance can be any of basic and filtered fee allowance.
  public var allowance: SwiftProtobuf.Google_Protobuf_Any {
    get {return _allowance ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_allowance = newValue}
  }
  /// Returns true if `allowance` has been explicitly set.
  public var hasAllowance: Bool {return self._allowance != nil}
  /// Clears the value of `allowance`. Subsequent reads from it will return its default value.
  public mutating func clearAllowance() {self._allowance = nil}

  /// allowed_messages are the messages for which the grantee has the access.
  public var allowedMessages: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _allowance: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// Grant is stored in the KVStore to record a grant with full context
public struct Cosmos_Feegrant_V1beta1_Grant {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// granter is the address of the user granting an allowance of their funds.
  public var granter: String = String()

  /// grantee is the address of the user being granted an allowance of another user's funds.
  public var grantee: String = String()

  /// allowance can be any of basic and filtered fee allowance.
  public var allowance: SwiftProtobuf.Google_Protobuf_Any {
    get {return _allowance ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_allowance = newValue}
  }
  /// Returns true if `allowance` has been explicitly set.
  public var hasAllowance: Bool {return self._allowance != nil}
  /// Clears the value of `allowance`. Subsequent reads from it will return its default value.
  public mutating func clearAllowance() {self._allowance = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _allowance: SwiftProtobuf.Google_Protobuf_Any? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Feegrant_V1beta1_BasicAllowance: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_PeriodicAllowance: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_AllowedMsgAllowance: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_Grant: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.feegrant.v1beta1"

extension Cosmos_Feegrant_V1beta1_BasicAllowance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BasicAllowance"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "spend_limit"),
    2: .same(proto: "expiration"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.spendLimit) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._expiration) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.spendLimit.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.spendLimit, fieldNumber: 1)
    }
    try { if let v = self._expiration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Feegrant_V1beta1_BasicAllowance, rhs: Cosmos_Feegrant_V1beta1_BasicAllowance) -> Bool {
    if lhs.spendLimit != rhs.spendLimit {return false}
    if lhs._expiration != rhs._expiration {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_PeriodicAllowance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PeriodicAllowance"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "basic"),
    2: .same(proto: "period"),
    3: .standard(proto: "period_spend_limit"),
    4: .standard(proto: "period_can_spend"),
    5: .standard(proto: "period_reset"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._basic) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._period) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.periodSpendLimit) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.periodCanSpend) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._periodReset) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._basic {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._period {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.periodSpendLimit.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.periodSpendLimit, fieldNumber: 3)
    }
    if !self.periodCanSpend.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.periodCanSpend, fieldNumber: 4)
    }
    try { if let v = self._periodReset {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Feegrant_V1beta1_PeriodicAllowance, rhs: Cosmos_Feegrant_V1beta1_PeriodicAllowance) -> Bool {
    if lhs._basic != rhs._basic {return false}
    if lhs._period != rhs._period {return false}
    if lhs.periodSpendLimit != rhs.periodSpendLimit {return false}
    if lhs.periodCanSpend != rhs.periodCanSpend {return false}
    if lhs._periodReset != rhs._periodReset {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_AllowedMsgAllowance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AllowedMsgAllowance"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "allowance"),
    2: .standard(proto: "allowed_messages"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._allowance) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.allowedMessages) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._allowance {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.allowedMessages.isEmpty {
      try visitor.visitRepeatedStringField(value: self.allowedMessages, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Feegrant_V1beta1_AllowedMsgAllowance, rhs: Cosmos_Feegrant_V1beta1_AllowedMsgAllowance) -> Bool {
    if lhs._allowance != rhs._allowance {return false}
    if lhs.allowedMessages != rhs.allowedMessages {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_Grant: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Grant"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "granter"),
    2: .same(proto: "grantee"),
    3: .same(proto: "allowance"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.granter) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.grantee) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._allowance) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.granter.isEmpty {
      try visitor.visitSingularStringField(value: self.granter, fieldNumber: 1)
    }
    if !self.grantee.isEmpty {
      try visitor.visitSingularStringField(value: self.grantee, fieldNumber: 2)
    }
    try { if let v = self._allowance {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Feegrant_V1beta1_Grant, rhs: Cosmos_Feegrant_V1beta1_Grant) -> Bool {
    if lhs.granter != rhs.granter {return false}
    if lhs.grantee != rhs.grantee {return false}
    if lhs._allowance != rhs._allowance {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
