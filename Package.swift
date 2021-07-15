// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RBPermissions",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "RBPermissions",
      targets: ["RBPermissions"]),
    
  ],
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
  ],
  targets: [
    .target(
      name: "RBPermissions",
      dependencies: ["RxSwift"]),
    .testTarget(
      name: "RBPermissionsTests",
      dependencies: ["RBPermissions"]),
  ],
  swiftLanguageVersions: [.v5]
)
