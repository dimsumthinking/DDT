// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("17.2"), .macOS("14.2")
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
