import Foundation
import Files

public struct CLI {
    private let arguments: [String]
    private let repositoryURL: URL
    private let version: String
    
    public init(arguments: [String] = CommandLine.arguments,
                repositoryURL: URL,
                version: String) {
        self.arguments = arguments
        self.repositoryURL = repositoryURL
        self.version = version
    }
    
    public func run(in folder: Folder = .current) throws {
        guard arguments.count > 1 else {
            return outputHelpText()
        }

        switch arguments[1] {
        
        default:
            outputHelpText()
        }
    }
}

// MARK: - Private
private extension CLI {
    func outputHelpText() {
        print("""
        ┌────────────────────────────────────────────────────────────────┐
        │ A new version of XcodeSnippet is available!                    │
        │                                                                │
        │ To update to the latest version, run "xcodeSnippet upgrade".   │
        └────────────────────────────────────────────────────────────────┘
        make your xcode snippet!
        
        OPTIONS:
            -v, --version           Commands that tell you the version of the current XcodeSnippet.
            
        Available commands:
            
            - new:                  Set up a new XcodeSnippet in current holder
            - run:                  Install user-created snippets.
            
          See 'xcodeSnippet help <subcommand>' for detailed help.
        """)
    }
}
