import Foundation
import XcodeSnippetCLICore

let cli = CLI(
    repositoryURL: URL(string: "https://github.com/JiHoonAHN/XcodeSnippet.git")!,
    version: "0.1.1"
)

do {
    try cli.run()
} catch {
    fputs("❌ \(error)\n", stderr)
    exit(1)
}
