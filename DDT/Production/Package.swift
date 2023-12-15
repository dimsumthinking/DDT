// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("17.2"), .macOS("14.2")
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
