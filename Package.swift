// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftLogger",
    products: [
        .library(
            name: "SwiftLogger",
            targets: ["SwiftLogger"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftLogger",
            dependencies: []),
        .testTarget(
            name: "SwiftLoggerTests",
            dependencies: ["SwiftLogger"]),
    ]
)
