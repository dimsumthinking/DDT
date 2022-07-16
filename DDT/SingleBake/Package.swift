// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
      .package(path: "../AppInfo"),
      .package(path: "../HelperViews"),
      .package(path: "../ComponentViews")
    ],
    targets: [
        .target(
            name: "SingleBake",
            dependencies: ["Components", "Persistence", "AppInfo", "HelperViews", "ComponentViews"]),
        .testTarget(
            name: "SingleBakeTests",
            dependencies: ["SingleBake"]),
    ]
)
