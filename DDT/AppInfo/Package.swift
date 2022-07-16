// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AppInfo",
  platforms: [
    .iOS("16.0"), .macOS("13.0")
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
