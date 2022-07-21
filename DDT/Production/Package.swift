// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("16.0"), .macOS("13.0")
  ],
  products: [
    .library(
      name: "Production",
      targets: ["Production"]),
  ],
  dependencies: [
    .package(path: "../Persistence"),
    .package(path: "../Components"),
    .package(path: "../MixAddition")
  ],
  targets: [
    .target(
      name: "Production",
      dependencies: ["Persistence", "Components", "MixAddition"]),
    .testTarget(
      name: "ProductionTests",
      dependencies: ["Production"]),
  ]
)
