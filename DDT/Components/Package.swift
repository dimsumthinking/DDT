// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("15.4"), .macOS("12.3")
  ],
  products: [
    .library(
      name: "Components",
      targets: ["Components"]),
  ],
  dependencies: [
    .package(path: "../HelperViews"),
    .package(path: "../Persistence")
  ],
  targets: [
    .target(
      name: "Components",
      dependencies: ["HelperViews", "Persistence"]),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"]),
  ]
)
