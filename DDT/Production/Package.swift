// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("18.0"), .macOS("15.0")
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
