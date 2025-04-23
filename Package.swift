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
                      url:"https://github.com/saitoiotken/SwiftPM-Sample/releases/download/6.39.3/FluctSDK.xcframework.zip",
                      checksum: "5afaead286d33b5e0475daddc242128e0c4d2a00a1dd8ab2f7ac28ca0407fb30"),
        .target(
            name: "FluctSDKResources",
            dependencies: [
                .target(name: "FluctSDK"),
            ],
//            resources: [.copy("FluctSDKResources.bundle")],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("AVKit"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                
                // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                // For now, these flags should be added manually to the project for integration.
//                 .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "FluctSDKTests",
            dependencies: ["FluctSDK"]
            ),
    ]
)
