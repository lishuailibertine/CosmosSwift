// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CosmosKit",
    platforms: [
        .iOS("10.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CosmosKit",
            targets: ["CosmosKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.18.0"),
        .package(name: "Secp256k1Swift",url: "https://github.com/mathwallet/Secp256k1Swift.git", from: "1.3.1"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift",from: "1.4.2"),
        .package(name: "Bech32", url: "https://github.com/lishuailibertine/Bech32", from: "1.0.4"),
        .package(url: "https://github.com/mxcl/PromiseKit.git", .upToNextMajor(from: "6.16.2")),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.4.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CosmosKit",
            dependencies: [.product(name: "SwiftProtobuf", package: "swift-protobuf"),"Secp256k1Swift","CryptoSwift",.product(name: "BIP32Swift", package: "Secp256k1Swift"),"Bech32","PromiseKit","Alamofire"]),
        .testTarget(
            name: "CosmosKitTests",
            dependencies: ["CosmosKit"]),
    ]
)
