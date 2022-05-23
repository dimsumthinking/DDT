// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SingleBake",
    platforms: [
      .iOS("15.4"), .macOS("12.3")
    ],
    products: [
        .library(
            name: "SingleBake",
            targets: ["SingleBake"]),
    ],
    dependencies: [
      .package(path: "../Components"),
      .package(path: "../Persistence")
    ],
    targets: [
        .target(
            name: "SingleBake",
            dependencies: ["Components", "Persistence"]),
        .testTarget(
            name: "SingleBakeTests",
            dependencies: ["SingleBake"]),
    ]
)
