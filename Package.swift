// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftyKit",
    platforms: [.iOS(.v11), .macOS(.v10_15)],
    products: [
        .library(
            name: "SwiftyKit",
            targets: ["SwiftyKit"]
        ),
        .library(
            name: "RxSwiftyKit",
            targets: ["RxSwiftyKit"]
        ),
        .library(
            name: "RealmSwiftyKit",
            targets: ["RealmSwiftyKit"]
        )
    ],
    dependencies: [
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
        .package(name: "Realm", url: "https://github.com/realm/realm-swift.git", from: "10.24.0")
    ],
    targets: [
        .target(
            name: "SwiftyKit",
            path: "SwiftyKit/Sources"
        ),
        .testTarget(
            name: "SwiftyKitTests",
            dependencies: ["SwiftyKit"],
            path: "SwiftyKit/Tests"
        ),
        .target(
            name: "RxSwiftyKit",
            dependencies: [
                "SwiftyKit",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift")
            ],
            path: "RxSwiftyKit/Sources"
        ),
        .target(
            name: "RealmSwiftyKit",
            dependencies: [
                "SwiftyKit",
                .product(name: "Realm", package: "Realm"),
                .product(name: "RealmSwift", package: "Realm")
            ],
            path: "RealmSwiftyKit/Sources"
        )
    ]
)
