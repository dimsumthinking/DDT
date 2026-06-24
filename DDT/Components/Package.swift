// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("27.0"), .macOS("27.0")
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
      dependencies: [],),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"]),
  ]
)
