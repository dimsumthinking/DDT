// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "MixAddition",
    platforms: [
      .iOS("16.0"), .macOS("13.0")
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
