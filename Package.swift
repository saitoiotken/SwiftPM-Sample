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
                      url:"https://github.com/saitoiotken/SwiftPM-Sample/releases/download/6.39.0.2/FluctSDK.xcframework.zip",
                      checksum: "0c0c5769388e8f97672328eafa4a49b3f82660366c82ea77caae59a6621917af"),
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
            dependencies: ["FluctSDKPackage"]
            ),
    ]
)
