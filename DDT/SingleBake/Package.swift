// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SingleBake",
    platforms: [
      .iOS("17.2"), .macOS("14.2")
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
