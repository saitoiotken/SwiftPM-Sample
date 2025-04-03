import XCTest
@testable import FluctSDKPackage

final class FluctSDKPackageTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FluctSDKPackage().text, "Hello, World!")
    }
    func testBundle() throws {
        if let bundleURL = Bundle.module.url(forResource: "FluctSDKResources", withExtension: "bundle") {
            if let resourceBundle = Bundle(url: bundleURL) {
                // ここでresourceBundleを使ってリソースにアクセスできます
                if let imageURL = UIImage(named: "btn_rewarded_video_voice_on", in: resourceBundle, compatibleWith: nil) {
                    // リソースのURLが取得できました。画像などをロードできます。
                    print("Image URL: \(imageURL)")
                }
                if let js = resourceBundle.url(forResource: "mraid", withExtension: "js") {
                    print("js: \(js)")
                }
            }
        }
    }
}
