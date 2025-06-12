// swift-tools-version:5.9
import PackageDescription
let package = Package(
    name: "ZendeskMessagingSDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ZendeskMessagingSDK",
            targets: [
              "ZendeskMessagingSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskMessagingAPISDK",
                 url: "https://github.com/dfindley-fetch/messagingapi_sdk_ios",
                 .branch("6.0.0-ios16-patch")),
        .package(name: "ZendeskCommonUISDK",
                 url: "https://github.com/dfindley-fetch/commonui_sdk_ios",
                 .branch("9.0.0-ios16-patch"))
    ],
    targets: [
        .binaryTarget(
            name: "MessagingSDK",
            path: "MessagingSDK.xcframework"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "MessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK"),
                    .product(name: "ZendeskCommonUISDK", package: "ZendeskCommonUISDK")
                ],
                path: "Sources"
        )
    ]
)
