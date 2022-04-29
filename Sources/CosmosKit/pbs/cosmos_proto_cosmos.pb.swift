// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos_proto/cosmos.proto
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

// MARK: - Extension support defined in cosmos.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_FieldOptions {

  /// accepts_interface is used to annote fields that accept interfaces
  public var CosmosProto_acceptsInterface: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_accepts_interface) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_accepts_interface, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_accepts_interface`
  /// has been explicitly set.
  public var hasCosmosProto_acceptsInterface: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_accepts_interface)
  }
  /// Clears the value of extension `CosmosProto_Extensions_accepts_interface`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCosmosProto_acceptsInterface() {
    clearExtensionValue(ext: CosmosProto_Extensions_accepts_interface)
  }

  /// scalar is used to define scalar types
  public var CosmosProto_scalar: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_scalar) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_scalar, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_scalar`
  /// has been explicitly set.
  public var hasCosmosProto_scalar: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_scalar)
  }
  /// Clears the value of extension `CosmosProto_Extensions_scalar`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCosmosProto_scalar() {
    clearExtensionValue(ext: CosmosProto_Extensions_scalar)
  }
}

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  /// implements_interface is used to annotate interface implementations
  public var CosmosProto_implementsInterface: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_implements_interface) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_implements_interface, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_implements_interface`
  /// has been explicitly set.
  public var hasCosmosProto_implementsInterface: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_implements_interface)
  }
  /// Clears the value of extension `CosmosProto_Extensions_implements_interface`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCosmosProto_implementsInterface() {
    clearExtensionValue(ext: CosmosProto_Extensions_implements_interface)
  }

}

// MARK: - File's ExtensionMap: CosmosProto_Cosmos_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let CosmosProto_Cosmos_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  CosmosProto_Extensions_implements_interface,
  CosmosProto_Extensions_accepts_interface,
  CosmosProto_Extensions_scalar
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// implements_interface is used to annotate interface implementations
public let CosmosProto_Extensions_implements_interface = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 93001,
  fieldName: "cosmos_proto.implements_interface"
)

/// accepts_interface is used to annote fields that accept interfaces
public let CosmosProto_Extensions_accepts_interface = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 93001,
  fieldName: "cosmos_proto.accepts_interface"
)

/// scalar is used to define scalar types
public let CosmosProto_Extensions_scalar = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 93002,
  fieldName: "cosmos_proto.scalar"
)
