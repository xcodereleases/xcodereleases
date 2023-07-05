// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var dependencies: [Package.Dependency] = []

#if swift(>=5.6)
dependencies = [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
]
#endif

let package = Package(
    name: "XcodeReleases",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "XcodeReleases", targets: ["XcodeReleases"]),
    ],
    dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        .target(name: "XcodeReleases"),
        
        .testTarget(name: "XcodeReleasesTests", dependencies: ["XcodeReleases"]),
    ]
)
