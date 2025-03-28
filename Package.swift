// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "FluctSDKPackage",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FluctSDKPackage",
            targets: ["FluctSDKPackage"]),
    ],
    dependencies: [
        // TODO 他の依存関係（もしあれば）
    ],
    targets: [
        .binaryTarget(name: "FluctSDK",
                      url:"https://github.com/saitoiotken/SwiftPM-Sample/blob/main/FluctSDK.xcframework.zip",
                      checksum: "9b12d6c882a405a2d4222173d5a59e6f934f4c4763531a6e7dec0d9c3d1b9687"),
        .target(
            name: "FluctSDKPackage",
            dependencies: [
                .target(name: "FluctSDK"),
            ],
            resources: [.copy("FluctSDKResources.bundle")],
            linkerSettings: [
                // TODO
            ])
    ]
)
