// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "SingleBake",
    platforms: [
      .iOS("27.0"), .macOS("27.0")
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
            dependencies: ["Components", "Persistence", "MixAddition"],),
        .testTarget(
            name: "SingleBakeTests",
            dependencies: ["SingleBake"]),
    ]
)
