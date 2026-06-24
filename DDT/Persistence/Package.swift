// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Persistence",
    platforms: [
      .iOS("27.0"), .macOS("27.0")
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
            dependencies: [],),
        .testTarget(
            name: "PersistenceTests",
            dependencies: ["Persistence"]),
    ]
)
