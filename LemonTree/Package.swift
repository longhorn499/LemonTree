// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LemonTree",
    platforms: [
        .iOS("13.6")
    ],
    products: [
        .library(
            name: "LemonTree",
            targets: ["LemonTree"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftDocOrg/CommonMark", from: "0.4.0")
    ],
    targets: [
        .target(
            name: "LemonTree",
            dependencies: ["CommonMark"]),
        .testTarget(
            name: "LemonTreeTests",
            dependencies: ["LemonTree"]),
    ]
)
