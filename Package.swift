// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Store",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Store",
            targets: ["Store"]),
    ],
    targets: [
        .target(
            name: "Store",
            path: "Sources"),
        .testTarget(
            name: "Tests",
            dependencies: ["Store"],
            path: "Tests")
    ]
)
