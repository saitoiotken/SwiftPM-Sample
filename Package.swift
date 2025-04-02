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
                      url:"https://github.com/saitoiotken/SwiftPM-Sample/releases/download/6.39.0/FluctSDK.xcframework.zip",
                      checksum: "9b12d6c882a405a2d4222173d5a59e6f934f4c4763531a6e7dec0d9c3d1b9687"),
        .target(
            name: "FluctSDKPackage",
            dependencies: [
                .target(name: "FluctSDK"),
            ],
            resources: [.copy("FluctSDKResources.bundle")],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("MessageUI"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                
                .linkedLibrary("z"),
                
                // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                // For now, these flags should be added manually to the project for integration.
                // .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "FluctSDKPackageTests",
            dependencies: ["FluctSDKPackage"]),
    ]
)
