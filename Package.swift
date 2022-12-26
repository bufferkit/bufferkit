// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "BufferKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "BufferKit",
            targets: ["BufferKit"]),
    ],
    targets: [
        .target(
            name: "BufferKit",
            path: "Sources"),
        .testTarget(
            name: "Tests",
            dependencies: ["BufferKit"],
            path: "Tests")
    ]
)
