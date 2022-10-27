// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RBPermissions",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "RBPermissionsCamera",
      targets: ["RBPermissionsCamera"]),
    
      .library(
        name: "RBPermissionsContacts",
        targets: ["RBPermissionsContacts"]),
    .library(
      name: "RBPermissionsLocationAlways",
      targets: ["RBPermissionsLocationAlways"]),
    .library(
      name: "RBPermissionsLocationWhenInUse",
      targets: ["RBPermissionsLocationWhenInUse"]),
    .library(
      name: "RBPermissionsNotification",
      targets: ["RBPermissionsNotification"]),
    .library(
      name: "RBPermissionsMotion",
      targets: ["RBPermissionsMotion"]),
    .library(
      name: "RBPermissionsPhoto",
      targets: ["RBPermissionsPhoto"]),
    .library(
      name: "RBPermissionsTracking",
      targets: ["RBPermissionsTracking"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "RBPermissions",
      dependencies: []),
    .target(
      name: "RBPermissionsCamera",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsContacts",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsLocationAlways",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsLocationWhenInUse",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsNotification",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsMotion",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsPhoto",
      dependencies: ["RBPermissions"]),
    .target(
      name: "RBPermissionsTracking",
      dependencies: ["RBPermissions"])
  ],
  swiftLanguageVersions: [.v5]
)
