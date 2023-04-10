import ProjectDescription

// MARK: - Constants

let name = "Calculator"
let organizationnName = "jjgp.calculator"

// MARK: - Info

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "NSMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
]

// MARK: - Targets

let mainTarget = Target(
    name: name,
    platform: .macOS,
    product: .app,
    bundleId: "\(organizationnName).\(name)",
    deploymentTarget: .macOS(targetVersion: "12.6.4"),
    infoPlist: .extendingDefault(with: infoPlist),
    sources: ["Targets/\(name)/Sources/**"],
    resources: ["Targets/\(name)/Resources/**"],
    dependencies: []
)

let testTarget = Target(
    name: "\(name)Tests",
    platform: .macOS,
    product: .unitTests,
    bundleId: "\(organizationnName).\(name)Tests",
    infoPlist: .default,
    sources: ["Targets/\(name)/Tests/**"],
    dependencies: [
        .target(name: "\(name)"),
    ]
)

let targets = [mainTarget, testTarget]

// MARK: - Project

let project = Project(
    name: name,
    organizationName: organizationnName,
    packages: [],
    targets: targets
)
