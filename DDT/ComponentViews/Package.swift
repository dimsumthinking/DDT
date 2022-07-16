// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "ComponentViews",
  platforms: [
    .iOS("16.0"), .macOS("13.0")
  ],
  products: [
    .library(
      name: "ComponentViews",
      targets: ["ComponentViews"]),
  ],
  dependencies: [
    .package(path: "../Components")
  ],
  targets: [
    .target(
      name: "ComponentViews",
      dependencies: ["Components"]),
    .testTarget(
      name: "ComponentViewsTests",
      dependencies: ["ComponentViews"]),
  ]
)
