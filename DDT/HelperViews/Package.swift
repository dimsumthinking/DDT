// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelperViews",
    platforms: [
      .iOS("15.4"), .macOS("12.3")
    ],
    products: [
        .library(
            name: "HelperViews",
            targets: ["HelperViews"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HelperViews",
            dependencies: []),
        .testTarget(
            name: "HelperViewsTests",
            dependencies: ["HelperViews"]),
    ]
)
