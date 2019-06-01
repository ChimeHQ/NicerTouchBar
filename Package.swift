// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "NicerTouchBar",
    platforms: [.macOS("10.10")],
    products: [
        .library(name: "NicerTouchBar", targets: ["NicerTouchBar"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "NicerTouchBar", dependencies: [], path: "NicerTouchBar/"),
        .testTarget(name: "NicerTouchBarTests", dependencies: ["NicerTouchBar"], path: "NicerTouchBarTests/"),
    ]
)
