// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelperViews",
    platforms: [
      .iOS("15.5"), .macOS("12.4")
    ],
    products: [
        .library(
            name: "HelperViews",
            targets: ["HelperViews"]),
    ],
    dependencies: [
      .package(path: "../AppInfo")
    ],
    targets: [
        .target(
            name: "HelperViews",
            dependencies: ["AppInfo"]),
        .testTarget(
            name: "HelperViewsTests",
            dependencies: ["HelperViews"]),
    ]
)
