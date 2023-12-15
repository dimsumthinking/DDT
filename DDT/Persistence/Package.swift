// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Persistence",
    platforms: [
      .iOS("17.2"), .macOS("14.2")
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
            dependencies: []),
        .testTarget(
            name: "PersistenceTests",
            dependencies: ["Persistence"]),
    ]
)
