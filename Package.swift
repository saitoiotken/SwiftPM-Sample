// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "FluctSDK",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FluctSDK",
            targets: ["FluctSDKResources"]),
    ],
    dependencies: [
        // TODO 他の依存関係（もしあれば）
    ],
    targets: [
        .binaryTarget(name: "FluctSDK",
                      url:"https://github.com/saitoiotken/SwiftPM-Sample/releases/download/6.39.2/FluctSDK.xcframework.zip",
                      checksum: "2238ec3f2fa75981ec104e72e200b0d140825be648e8d5a91cee94610a8c63e4"),
        .target(
            name: "FluctSDKResources",
            dependencies: [
                .target(name: "FluctSDK"),
            ],
//            resources: [.copy("FluctSDKResources.bundle")],
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
            name: "FluctSDKTests",
            dependencies: ["FluctSDK"]
            ),
    ]
)
