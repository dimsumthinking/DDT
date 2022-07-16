// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Persistence",
    platforms: [
      .iOS("16.0"), .macOS("13.0")
    ],
    products: [
        .library(
            name: "Persistence",
            targets: ["Persistence"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Persistence",
            dependencies: [],
            resources: [.process("Model.xcdatamodeld")]),
        .testTarget(
            name: "PersistenceTests",
            dependencies: ["Persistence"]),
    ]
)
