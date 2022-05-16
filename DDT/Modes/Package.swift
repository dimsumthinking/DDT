// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modes",
    platforms: [
      .iOS("15.4"), .macOS("12.3")
    ],
    products: [
        .library(
            name: "Modes",
            targets: ["Modes"]),
    ],
    dependencies: [
      .package(path: "../HelperViews")
    ],
    targets: [
        .target(
            name: "Modes",
            dependencies: ["HelperViews"]),
        .testTarget(
            name: "ModesTests",
            dependencies: ["Modes"]),
    ]
)
