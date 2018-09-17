// swift-tools-version:4.0
import PackageDescription

#if os(macOS)
// macOS: Kitura
var package = Package(
    name: "Game",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.5.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1"))
    ],
    targets: [
      .target(name: "Shared"),
      .target(name: "Server", dependencies: ["Shared","Kitura","HeliumLogger"])
    ]
)

#else
// Ubuntu: Lambda build
var package = Package(
    name: "Game",
    exclude: ["Sources/Server"],
    dependencies: [
    ],
    targets: [
      .target(name: "Shared"),
      .target(name: "Lambda", dependencies: ["Shared"])
    ]
)

#endif
