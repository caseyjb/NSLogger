// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NSLogger",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "NSLoggerSwift",
            targets: ["NSLoggerSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "NSLogger",
            dependencies: [],
            path: "Client/iOS/Sources",
            sources: ["LoggerClient.m"],
            publicHeadersPath: "./",
            cSettings: [
                .unsafeFlags(["-fno-objc-arc", "-Wno-nullability-completeness"]),
                .define("NSLOGGER_WAS_HERE", to: "1"),
                .define("NSLOGGER_BUILD_USERNAME", to: "${USER}")
            ]),
        .target(
            name: "NSLoggerSwift",
            dependencies: ["NSLogger"],
            path: "Client/iOS/Sources",
            sources: ["NSLogger.swift"])
    ]
)
