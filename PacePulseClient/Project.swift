@preconcurrency import ProjectDescription

let project = Project(
    name: "PacePulseClient",
    targets: [
        .target(
            name: "PacePulseClient",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.hyukggun.PacePulseClient",
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "Then"),
                .external(name: "Supabase")
            ]
        ),
        .target(
            name: "PacePulseClientTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.hyukggun.PacePulseClientTests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "PacePulseClient"),
            ]
        )
    ]
)