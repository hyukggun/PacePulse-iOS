@preconcurrency import ProjectDescription

let infoPlist: [String: Plist.Value] = [
    // 사용자 디스플레이모드를 Light 로 한정
    "UIUserInterfaceStyle" : "Light",
    "CFBundleShortVersionString" : "1.0",
    // LaunchScreen 정의하기
    "UILaunchStoryboardName": "LaunchScreen",
    // UIApplicationSceneManifest 정의하기 - 일반적인 UIKit Project 생성과 동일하게 맞춤
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
             [
                "UISceneConfigurationName": "Default Configuration",
                "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
             ]
            ]
        ]
    ],
    "NSHealthShareUsageDescription": "PacePulse는 Apple Health와 연동하여 운동 기록을 관리합니다.",
    "NSHealthUpdateUsageDescription": "PacePulse는 Apple Health와 연동하여 운동 기록을 관리합니다.",
]

let project = Project(
    name: "PacePulseApp",
    settings: .settings(
        base: ["DEVELOPMENT_TEAM": "3K6R8VY7W5"],
        debug: [:],
        release: [:],
        defaultSettings: .recommended
    ),
    targets: [
        .target(
            name: "PacePulseApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.hyukggun.PacePulse",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            entitlements: .dictionary([
                "com.apple.developer.healthkit" : true
            ]),
            dependencies: [
                .project(target: "PacePulseCore", path: "../PacePulseCore"),
                .external(name: "PinLayout"),
                .external(name: "Then")
            ]
        )
    ]
)



