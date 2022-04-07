// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/orm/v1alpha1/schema.proto
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

/// StorageType
enum Cosmos_Orm_V1alpha1_StorageType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// STORAGE_TYPE_DEFAULT_UNSPECIFIED indicates the persistent
  /// KV-storage where primary key entries are stored in merkle-tree
  /// backed commitment storage and indexes and seqs are stored in
  /// fast index storage. Note that the Cosmos SDK before store/v2
  /// does not support this.
  case defaultUnspecified // = 0

  /// STORAGE_TYPE_MEMORY indicates in-memory storage that will be
  /// reloaded every time an app restarts. Tables with this type of storage
  /// will by default be ignored when importing and exporting a module's
  /// state from JSON.
  case memory // = 1

  /// STORAGE_TYPE_TRANSIENT indicates transient storage that is reset
  /// at the end of every block. Tables with this type of storage
  /// will by default be ignored when importing and exporting a module's
  /// state from JSON.
  case transient // = 2

  /// STORAGE_TYPE_INDEX indicates persistent storage which is not backed
  /// by a merkle-tree and won't affect the app hash. Note that the Cosmos SDK
  /// before store/v2 does not support this.
  case index // = 3

  /// STORAGE_TYPE_INDEX indicates persistent storage which is backed by
  /// a merkle-tree. With this type of storage, both primary and index keys
  /// will affect the app hash and this is generally less efficient
  /// than using STORAGE_TYPE_DEFAULT_UNSPECIFIED which separates index
  /// keys into index storage. Note that modules built with the
  /// Cosmos SDK before store/v2 must specify STORAGE_TYPE_COMMITMENT
  /// instead of STORAGE_TYPE_DEFAULT_UNSPECIFIED or STORAGE_TYPE_INDEX
  /// because this is the only type of persistent storage available.
  case commitment // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .defaultUnspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .defaultUnspecified
    case 1: self = .memory
    case 2: self = .transient
    case 3: self = .index
    case 4: self = .commitment
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .defaultUnspecified: return 0
    case .memory: return 1
    case .transient: return 2
    case .index: return 3
    case .commitment: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Orm_V1alpha1_StorageType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Orm_V1alpha1_StorageType] = [
    .defaultUnspecified,
    .memory,
    .transient,
    .index,
    .commitment,
  ]
}

#endif  // swift(>=4.2)

/// ModuleSchemaDescriptor describe's a module's ORM schema.
struct Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var schemaFile: [Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.FileEntry] = []

  /// prefix is an optional prefix that precedes all keys in this module's
  /// store.
  var prefix: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// FileEntry describes an ORM file used in a module.
  struct FileEntry {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// id is a prefix that will be varint encoded and prepended to all the
    /// table keys specified in the file's tables.
    var id: UInt32 = 0

    /// proto_file_name is the name of a file .proto in that contains
    /// table definitions. The .proto file must be in a package that the
    /// module has referenced using cosmos.app.v1.ModuleDescriptor.use_package.
    var protoFileName: String = String()

    /// storage_type optionally indicates the type of storage this file's
    /// tables should used. If it is left unspecified, the default KV-storage
    /// of the app will be used.
    var storageType: Cosmos_Orm_V1alpha1_StorageType = .defaultUnspecified

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Orm_V1alpha1_StorageType: @unchecked Sendable {}
extension Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor: @unchecked Sendable {}
extension Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.FileEntry: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Extension support defined in schema.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  /// module_schema is used to define the ORM schema for an app module.
  /// All module config messages that use module_schema must also declare
  /// themselves as app module config messages using the cosmos.app.v1.is_module
  /// option.
  var Cosmos_Orm_V1alpha1_moduleSchema: Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor {
    get {return getExtensionValue(ext: Cosmos_Orm_V1alpha1_Extensions_module_schema) ?? Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor()}
    set {setExtensionValue(ext: Cosmos_Orm_V1alpha1_Extensions_module_schema, value: newValue)}
  }
  /// Returns true if extension `Cosmos_Orm_V1alpha1_Extensions_module_schema`
  /// has been explicitly set.
  var hasCosmos_Orm_V1alpha1_moduleSchema: Bool {
    return hasExtensionValue(ext: Cosmos_Orm_V1alpha1_Extensions_module_schema)
  }
  /// Clears the value of extension `Cosmos_Orm_V1alpha1_Extensions_module_schema`.
  /// Subsequent reads from it will return its default value.
  mutating func clearCosmos_Orm_V1alpha1_moduleSchema() {
    clearExtensionValue(ext: Cosmos_Orm_V1alpha1_Extensions_module_schema)
  }

}

// MARK: - File's ExtensionMap: Cosmos_Orm_V1alpha1_Schema_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
let Cosmos_Orm_V1alpha1_Schema_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Cosmos_Orm_V1alpha1_Extensions_module_schema
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// module_schema is used to define the ORM schema for an app module.
/// All module config messages that use module_schema must also declare
/// themselves as app module config messages using the cosmos.app.v1.is_module
/// option.
let Cosmos_Orm_V1alpha1_Extensions_module_schema = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 104503792,
  fieldName: "cosmos.orm.v1alpha1.module_schema"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.orm.v1alpha1"

extension Cosmos_Orm_V1alpha1_StorageType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "STORAGE_TYPE_DEFAULT_UNSPECIFIED"),
    1: .same(proto: "STORAGE_TYPE_MEMORY"),
    2: .same(proto: "STORAGE_TYPE_TRANSIENT"),
    3: .same(proto: "STORAGE_TYPE_INDEX"),
    4: .same(proto: "STORAGE_TYPE_COMMITMENT"),
  ]
}

extension Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ModuleSchemaDescriptor"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "schema_file"),
    2: .same(proto: "prefix"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.schemaFile) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.prefix) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.schemaFile.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.schemaFile, fieldNumber: 1)
    }
    if !self.prefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.prefix, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor, rhs: Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor) -> Bool {
    if lhs.schemaFile != rhs.schemaFile {return false}
    if lhs.prefix != rhs.prefix {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.FileEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.protoMessageName + ".FileEntry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "proto_file_name"),
    3: .standard(proto: "storage_type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.protoFileName) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.storageType) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.protoFileName.isEmpty {
      try visitor.visitSingularStringField(value: self.protoFileName, fieldNumber: 2)
    }
    if self.storageType != .defaultUnspecified {
      try visitor.visitSingularEnumField(value: self.storageType, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.FileEntry, rhs: Cosmos_Orm_V1alpha1_ModuleSchemaDescriptor.FileEntry) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.protoFileName != rhs.protoFileName {return false}
    if lhs.storageType != rhs.storageType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
