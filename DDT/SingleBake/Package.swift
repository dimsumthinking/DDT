// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SingleBake",
    platforms: [
      .iOS("16.0"), .macOS("13.0")
    ],
    products: [
        .library(
            name: "SingleBake",
            targets: ["SingleBake"]),
    ],
    dependencies: [
      .package(path: "../Components"),
      .package(path: "../Persistence"),
      .package(path: "../MixAddition")
    ],
    targets: [
        .target(
            name: "SingleBake",
            dependencies: ["Components", "Persistence", "MixAddition"]),
        .testTarget(
            name: "SingleBakeTests",
            dependencies: ["SingleBake"]),
    ]
)
