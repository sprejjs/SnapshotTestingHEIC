// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "SnapshotTestingHEIC",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v10)
    ],
    products: [
        .library(
            name: "SnapshotTestingHEIC",
            targets: ["SnapshotTestingHEIC"]),
    ],
    dependencies: [
        .package(url: "git@github.com:pimms/swift-snapshot-testing.git",
                 .revision("0efeef44df913fe60ea868f037f271ac927a8e8c")),
    ],
    targets: [
        .target(
            name: "SnapshotTestingHEIC",
            dependencies: [
                .product(name: "SnapshotTesting",
                         package: "swift-snapshot-testing"),
            ]
        ),
        .testTarget(
            name: "SnapshotTestingHEICTests",
            dependencies: ["SnapshotTestingHEIC"],
            exclude: ["__Snapshots__"]
        ),
    ]
)
