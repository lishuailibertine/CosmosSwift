// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/feegrant/v1beta1/tx.proto
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

/// MsgGrantAllowance adds permission for Grantee to spend up to Allowance
/// of fees from the account of Granter.
struct Cosmos_Feegrant_V1beta1_MsgGrantAllowance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// granter is the address of the user granting an allowance of their funds.
  var granter: String = String()

  /// grantee is the address of the user being granted an allowance of another user's funds.
  var grantee: String = String()

  /// allowance can be any of basic and filtered fee allowance.
  var allowance: SwiftProtobuf.Google_Protobuf_Any {
    get {return _allowance ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_allowance = newValue}
  }
  /// Returns true if `allowance` has been explicitly set.
  var hasAllowance: Bool {return self._allowance != nil}
  /// Clears the value of `allowance`. Subsequent reads from it will return its default value.
  mutating func clearAllowance() {self._allowance = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _allowance: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// MsgGrantAllowanceResponse defines the Msg/GrantAllowanceResponse response type.
struct Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRevokeAllowance removes any existing Allowance from Granter to Grantee.
struct Cosmos_Feegrant_V1beta1_MsgRevokeAllowance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// granter is the address of the user granting an allowance of their funds.
  var granter: String = String()

  /// grantee is the address of the user being granted an allowance of another user's funds.
  var grantee: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRevokeAllowanceResponse defines the Msg/RevokeAllowanceResponse response type.
struct Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Feegrant_V1beta1_MsgGrantAllowance: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_MsgRevokeAllowance: @unchecked Sendable {}
extension Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.feegrant.v1beta1"

extension Cosmos_Feegrant_V1beta1_MsgGrantAllowance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgGrantAllowance"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "granter"),
    2: .same(proto: "grantee"),
    3: .same(proto: "allowance"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
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

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
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

  static func ==(lhs: Cosmos_Feegrant_V1beta1_MsgGrantAllowance, rhs: Cosmos_Feegrant_V1beta1_MsgGrantAllowance) -> Bool {
    if lhs.granter != rhs.granter {return false}
    if lhs.grantee != rhs.grantee {return false}
    if lhs._allowance != rhs._allowance {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgGrantAllowanceResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse, rhs: Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_MsgRevokeAllowance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeAllowance"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "granter"),
    2: .same(proto: "grantee"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.granter) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.grantee) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.granter.isEmpty {
      try visitor.visitSingularStringField(value: self.granter, fieldNumber: 1)
    }
    if !self.grantee.isEmpty {
      try visitor.visitSingularStringField(value: self.grantee, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Feegrant_V1beta1_MsgRevokeAllowance, rhs: Cosmos_Feegrant_V1beta1_MsgRevokeAllowance) -> Bool {
    if lhs.granter != rhs.granter {return false}
    if lhs.grantee != rhs.grantee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeAllowanceResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse, rhs: Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
