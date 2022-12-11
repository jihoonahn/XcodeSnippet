import Foundation
import Files

struct XcodeSnippet {
    var title: String?
    var summary: String?
    var code: String?
    var language: String
    var platform: PlatformType
    var completion: String?
    var availability: [AvailabilityType]
}

