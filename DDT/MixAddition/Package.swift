// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MixAddition",
    platforms: [
      .iOS("17.2"), .macOS("14.2")
    ],
    products: [
        .library(
            name: "MixAddition",
            targets: ["MixAddition"]),
    ],
    dependencies: [
      .package(path: "../Persistence"),
      .package(path: "../Components")
    ],
    targets: [
        .target(
            name: "MixAddition",
            dependencies: ["Persistence", "Components"]),
        .testTarget(
            name: "MixAdditionTests",
            dependencies: ["MixAddition"]),
    ]
)
