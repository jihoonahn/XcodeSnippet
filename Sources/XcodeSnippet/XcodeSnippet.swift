import Foundation
import Files

public struct XcodeSnippet {
    var id: UUID = UUID()
    var title: String?
    var summary: String?
    var code: String?
    var language: String
    var platform: PlatformType
    var completion: String?
    var availability: [AvailabilityType]
    
    public init(title: String?,
                summary: String?,
                code: String?,
                language: String,
                platform: PlatformType,
                completion: String?,
                availability: [AvailabilityType]) {
        self.title = title
        self.summary = summary
        self.code = code
        self.language = language
        self.platform = platform
        self.completion = completion
        self.availability = availability
    }
}

extension XcodeSnippet {
    func generateSnippet(folder: Folder) throws {
        let file = try folder.createFile(named: "\(self.id).codesnippet")
        try file.write("""
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>IDECodeSnippetCompletionPrefix</key>
            <string>\(completion ?? "")</string>
            <key>IDECodeSnippetCompletionScopes</key>
            <array>
                \(availabilityString())
            </array>
            <key>IDECodeSnippetContents</key>
            <string>\(codeString())</string>
            <key>IDECodeSnippetIdentifier</key>
            <string>\(id)</string>
            <key>IDECodeSnippetLanguage</key>
            <string>Xcode.SourceCodeLanguage.\(language)</string>
            <key>IDECodeSnippetSummary</key>
            <string>\(summary ?? "")</string>
            <key>IDECodeSnippetTitle</key>
            <string>\(title ?? "")</string>
            <key>IDECodeSnippetUserSnippet</key>
            <true/>
            <key>IDECodeSnippetVersion</key>
            <integer>0</integer>
        </dict>
        </plist>
        """)
    }
}

// MARK: - Private
private extension XcodeSnippet {
    func availabilityString() -> String {
        return availability.map { "<string>\($0)</string>" }.joined()
    }
    func codeString() -> String {
        let stringReform = code?
            .replacingOccurrences(of: "<#", with: "&lt;#")
            .replacingOccurrences(of: "#>", with: "#&gt;")
        return stringReform ?? ""
    }
}
