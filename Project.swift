import ProjectDescription

// MARK: - Constants

let name = "Calculator"
let deploymentTarget: DeploymentTarget = .macOS(targetVersion: "13.0")
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
    deploymentTarget: deploymentTarget,
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
    deploymentTarget: deploymentTarget,
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
