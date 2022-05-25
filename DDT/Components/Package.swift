// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("15.5"), .macOS("12.4")
  ],
  products: [
    .library(
      name: "Components",
      targets: ["Components"]),
  ],
  dependencies: [
    .package(path: "../AppInfo")
  ],
  targets: [
    .target(
      name: "Components",
      dependencies: ["AppInfo"]),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"]),
  ]
)
