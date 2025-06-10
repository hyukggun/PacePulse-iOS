// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "PacePulsePackage",
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "7.12.0")),
        .package(url: "https://github.com/LayoutBox/PinLayout", .upToNextMajor(from: "1.10.5")),
        .package(url: "https://github.com/LayoutBox/FlexLayout", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/supabase/supabase-swift.git", from: "2.29.0"),
    ]
)


