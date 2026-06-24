// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("27.0"), .macOS("27.0")
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
      dependencies: ["Persistence", "Components", "MixAddition"],),
    .testTarget(
      name: "ProductionTests",
      dependencies: ["Production"]),
  ]
)
