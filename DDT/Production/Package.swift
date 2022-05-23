// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("15.4"), .macOS("12.3")
  ],
  products: [
    .library(
      name: "Production",
      targets: ["Production"]),
  ],
  dependencies: [
    .package(path: "../Persistence")
  ],
  targets: [
    .target(
      name: "Production",
      dependencies: ["Persistence"]),
    .testTarget(
      name: "ProductionTests",
      dependencies: ["Production"]),
  ]
)