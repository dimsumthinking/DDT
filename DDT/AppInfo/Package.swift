// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppInfo",
    platforms: [
      .iOS("15.5"), .macOS("12.4")
    ],
    products: [
        .library(
            name: "AppInfo",
            targets: ["AppInfo"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AppInfo",
            dependencies: []),
        .testTarget(
            name: "AppInfoTests",
            dependencies: ["AppInfo"]),
    ]
)
