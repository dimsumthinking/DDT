// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Production",
  platforms: [
    .iOS("15.5"), .macOS("12.4")
  ],
  products: [
    .library(
      name: "Production",
      targets: ["Production"]),
  ],
  dependencies: [
    .package(path: "../Persistence"),
    .package(path: "../AppInfo"),
    .package(path: "../Components"),
    .package(path: "../HelperViews")
  ],
  targets: [
    .target(
      name: "Production",
      dependencies: ["Persistence", "AppInfo", "Components", "HelperViews"]),
    .testTarget(
      name: "ProductionTests",
      dependencies: ["Production"]),
  ]
)
