import Foundation

enum PlatformType: String {
    case All
    case DriverKit
    case iOS
    case macOS
    case tvOS
    case watchOS
}

extension PlatformType: CustomStringConvertible {
    var description: String {
        switch self {
        case .All:
            return ""
        case .DriverKit:
            return "driverkit"
        case .iOS:
            return "iphoneos"
        case .macOS:
            return "macosx"
        case .tvOS:
            return "appletvos"
        case .watchOS:
            return "watchos"
        }
    }
}
