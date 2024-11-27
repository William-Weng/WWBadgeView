// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWBadgeView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWBadgeView", targets: ["WWBadgeView"]),
    ],
    targets: [
        .target(name: "WWBadgeView", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
