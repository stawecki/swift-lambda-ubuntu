import PackageDescription

var package = Package(
    name: "Game",
    targets: [
        Target(name: "Shared"),
        Target(name: "Lambda", dependencies: ["Shared"])
    ],
    dependencies: [
    ], 
    exclude: ["Sources/Server"])

#if os(macOS)
package.targets.append(Target(name: "Server", dependencies: ["Shared"]))
package.dependencies.append(.Package(url: "https://github.com/IBM-Swift/Kitura", majorVersion: 1, minor: 1))
package.dependencies.append(.Package(url: "https://github.com/IBM-Swift/HeliumLogger", majorVersion: 1, minor: 1))
package.exclude = []
#endif
