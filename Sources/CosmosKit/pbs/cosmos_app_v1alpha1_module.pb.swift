// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/app/v1alpha1/module.proto
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

/// ModuleDescriptor describes an app module.
struct Cosmos_App_V1alpha1_ModuleDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// go_import names the package that should be imported by an app to load the
  /// module in the runtime module registry. Either go_import must be defined here
  /// or the go_package option must be defined at the file level to indicate
  /// to users where to location the module implementation. go_import takes
  /// precedence over go_package when both are defined.
  var goImport: String = String()

  /// use_package refers to a protobuf package that this module
  /// uses and exposes to the world. In an app, only one module should "use"
  /// or own a single protobuf package. It is assumed that the module uses
  /// all of the .proto files in a single package.
  var usePackage: [Cosmos_App_V1alpha1_PackageReference] = []

  /// can_migrate_from defines which module versions this module can migrate
  /// state from. The framework will check that one module version is able to
  /// migrate from a previous module version before attempting to update its
  /// config. It is assumed that modules can transitively migrate from earlier
  /// versions. For instance if v3 declares it can migrate from v2, and v2
  /// declares it can migrate from v1, the framework knows how to migrate
  /// from v1 to v3, assuming all 3 module versions are registered at runtime.
  var canMigrateFrom: [Cosmos_App_V1alpha1_MigrateFromInfo] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// PackageReference is a reference to a protobuf package used by a module.
struct Cosmos_App_V1alpha1_PackageReference {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// name is the fully-qualified name of the package.
  var name: String = String()

  /// revision is the optional revision of the package that is being used.
  /// Protobuf packages used in Cosmos should generally have a major version
  /// as the last part of the package name, ex. foo.bar.baz.v1.
  /// The revision of a package can be thought of as the minor version of a
  /// package which has additional backwards compatible definitions that weren't
  /// present in a previous version.
  ///
  /// A package should indicate its revision with a source code comment
  /// above the package declaration in one of its fields containing the
  /// test "Revision N" where N is an integer revision. All packages start
  /// at revision 0 the first time they are released in a module.
  ///
  /// When a new version of a module is released and items are added to existing
  /// .proto files, these definitions should contain comments of the form
  /// "Since Revision N" where N is an integer revision.
  ///
  /// When the module runtime starts up, it will check the pinned proto
  /// image and panic if there are runtime protobuf definitions that are not
  /// in the pinned descriptor which do not have
  /// a "Since Revision N" comment or have a "Since Revision N" comment where
  /// N is <= to the revision specified here. This indicates that the protobuf
  /// files have been updated, but the pinned file descriptor hasn't.
  ///
  /// If there are items in the pinned file descriptor with a revision
  /// greater than the value indicated here, this will also cause a panic
  /// as it may mean that the pinned descriptor for a legacy module has been
  /// improperly updated or that there is some other versioning discrepancy.
  /// Runtime protobuf definitions will also be checked for compatibility
  /// with pinned file descriptors to make sure there are no incompatible changes.
  ///
  /// This behavior ensures that:
  /// * pinned proto images are up-to-date
  /// * protobuf files are carefully annotated with revision comments which
  ///   are important good client UX
  /// * protobuf files are changed in backwards and forwards compatible ways
  var revision: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MigrateFromInfo is information on a module version that a newer module
/// can migrate from.
struct Cosmos_App_V1alpha1_MigrateFromInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// module is the fully-qualified protobuf name of the module config object
  /// for the previous module version, ex: "cosmos.group.module.v1.Module".
  var module: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_App_V1alpha1_ModuleDescriptor: @unchecked Sendable {}
extension Cosmos_App_V1alpha1_PackageReference: @unchecked Sendable {}
extension Cosmos_App_V1alpha1_MigrateFromInfo: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Extension support defined in module.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  /// module indicates that this proto type is a config object for an app module
  /// and optionally provides other descriptive information about the module.
  /// It is recommended that a new module config object and go module is versioned
  /// for every state machine breaking version of a module. The recommended
  /// pattern for doing this is to put module config objects in a separate proto
  /// package from the API they expose. Ex: the cosmos.group.v1 API would be
  /// exposed by module configs cosmos.group.module.v1, cosmos.group.module.v2, etc.
  var Cosmos_App_V1alpha1_module: Cosmos_App_V1alpha1_ModuleDescriptor {
    get {return getExtensionValue(ext: Cosmos_App_V1alpha1_Extensions_module) ?? Cosmos_App_V1alpha1_ModuleDescriptor()}
    set {setExtensionValue(ext: Cosmos_App_V1alpha1_Extensions_module, value: newValue)}
  }
  /// Returns true if extension `Cosmos_App_V1alpha1_Extensions_module`
  /// has been explicitly set.
  var hasCosmos_App_V1alpha1_module: Bool {
    return hasExtensionValue(ext: Cosmos_App_V1alpha1_Extensions_module)
  }
  /// Clears the value of extension `Cosmos_App_V1alpha1_Extensions_module`.
  /// Subsequent reads from it will return its default value.
  mutating func clearCosmos_App_V1alpha1_module() {
    clearExtensionValue(ext: Cosmos_App_V1alpha1_Extensions_module)
  }

}

// MARK: - File's ExtensionMap: Cosmos_App_V1alpha1_Module_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
let Cosmos_App_V1alpha1_Module_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Cosmos_App_V1alpha1_Extensions_module
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// module indicates that this proto type is a config object for an app module
/// and optionally provides other descriptive information about the module.
/// It is recommended that a new module config object and go module is versioned
/// for every state machine breaking version of a module. The recommended
/// pattern for doing this is to put module config objects in a separate proto
/// package from the API they expose. Ex: the cosmos.group.v1 API would be
/// exposed by module configs cosmos.group.module.v1, cosmos.group.module.v2, etc.
let Cosmos_App_V1alpha1_Extensions_module = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Cosmos_App_V1alpha1_ModuleDescriptor>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 57193479,
  fieldName: "cosmos.app.v1alpha1.module"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.app.v1alpha1"

extension Cosmos_App_V1alpha1_ModuleDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ModuleDescriptor"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "go_import"),
    2: .standard(proto: "use_package"),
    3: .standard(proto: "can_migrate_from"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.goImport) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.usePackage) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.canMigrateFrom) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.goImport.isEmpty {
      try visitor.visitSingularStringField(value: self.goImport, fieldNumber: 1)
    }
    if !self.usePackage.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.usePackage, fieldNumber: 2)
    }
    if !self.canMigrateFrom.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.canMigrateFrom, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_ModuleDescriptor, rhs: Cosmos_App_V1alpha1_ModuleDescriptor) -> Bool {
    if lhs.goImport != rhs.goImport {return false}
    if lhs.usePackage != rhs.usePackage {return false}
    if lhs.canMigrateFrom != rhs.canMigrateFrom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_App_V1alpha1_PackageReference: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PackageReference"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "revision"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.revision) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if self.revision != 0 {
      try visitor.visitSingularUInt32Field(value: self.revision, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_PackageReference, rhs: Cosmos_App_V1alpha1_PackageReference) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.revision != rhs.revision {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_App_V1alpha1_MigrateFromInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MigrateFromInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "module"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.module) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.module.isEmpty {
      try visitor.visitSingularStringField(value: self.module, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_MigrateFromInfo, rhs: Cosmos_App_V1alpha1_MigrateFromInfo) -> Bool {
    if lhs.module != rhs.module {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
