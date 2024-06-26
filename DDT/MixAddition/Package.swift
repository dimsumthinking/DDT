// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MixAddition",
    platforms: [
      .iOS("18.0"), .macOS("15.0")
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
            dependencies: ["Persistence", "Components"],
            swiftSettings: [.swiftLanguageVersion(.v6)]),
        .testTarget(
            name: "MixAdditionTests",
            dependencies: ["MixAddition"]),
    ]
)
