// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SingleBake",
    platforms: [
      .iOS("18.0"), .macOS("15.0")
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
