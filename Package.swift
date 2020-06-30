// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "meishi-console",
    platforms: [.macOS(.v10_14)],
    products: [
        .executable(name: "meishi-console", targets: ["meishi-console"])
    ],
    dependencies: [
        .package(url: "https://github.com/BiAtoms/Http.swift.git", from: "2.2.0")
    ],
    targets: [
        .target(
            name: "meishi-console",
            dependencies: ["HttpSwift"]
        )
    ]
)
