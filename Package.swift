// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "POCScanTrackingTagPackage",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "POCScanTrackingTagPackage",
            targets: ["POCScanTrackingTagPackage"]),
    ],
    dependencies: [
        // Add any package dependencies here
    ],
    targets: [
        .target(
            name: "POCScanTrackingTagPackage",
            dependencies: [],
            path: "Sources/POCScanTrackingTagPackage"),
        .testTarget(
            name: "POCScanTrackingTagPackageTests",
            dependencies: ["POCScanTrackingTagPackage"],
            path: "Tests/POCScanTrackingTagPackageTests"),
    ]
)
