// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "MixAddition",
    platforms: [
      .iOS("27.0"), .macOS("27.0")
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
