@preconcurrency import ProjectDescription

let project = Project(
    name: "PacePulseCore",
    targets: [
        .target(
            name: "PacePulseCore",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.hyukggun.health.PacePulseCore",
            sources: ["Sources/**"]
        )
    ]
)
