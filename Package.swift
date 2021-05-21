// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftyAttributes",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_11),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "SwiftyAttributes", targets: ["SwiftyAttributes"])
    ],
    targets: [
        .target(name: "SwiftyAttributes", path: "SwiftyAttributes"),
        .testTarget(name: "SwiftyAttributesTests", dependencies: ["SwiftyAttributes"], path: "SwiftyAttributesTests")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
