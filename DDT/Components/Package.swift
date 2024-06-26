// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS("18.0"), .macOS("15.0")
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
      dependencies: [],
      swiftSettings: [.swiftLanguageVersion(.v6)]),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"]),
  ]
)
