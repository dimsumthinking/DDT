// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("16.0"), .macOS("13.0")
  ],
  products: [
    .library(
      name: "Components",
      targets: ["Components"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Components",
      dependencies: []),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"]),
  ]
)
