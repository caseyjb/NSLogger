// swift-tools-version:5.2

import PackageDescription

let package = Package(
	name: "NSLogger",
	products: [
		.library(name: "NSLogger", targets: ["NSLogger"])
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "NSLogger",
			dependencies: ["NSLoggerLibObjC"],
			path: "Client/iOS",
			sources: ["NSLogger.swift"],
            swiftSettings: [SwiftSetting.define("SPMBuild")]
		),
		.target(
			name: "NSLoggerLibObjC",
			dependencies: [],
			path: "Client/iOS",
			sources: ["LoggerClient.m"],
            publicHeadersPath: "PublicHeaders",
            cSettings: [
                CSetting.unsafeFlags(["-fno-objc-arc"]),
                CSetting.define("NSLOGGER_WAS_HERE", to: "1"),
                CSetting.define("NSLOGGER_BUILD_USERNAME", to: "${USER}")
            ]
		),
        .testTarget(
            name: "NSLoggerTests",
            dependencies: ["NSLogger"],
            path: "SPMTests"
        )
	],
	swiftLanguageVersions: [.v5]
)
