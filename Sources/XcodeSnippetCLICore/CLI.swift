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
        print(version)
    }
}

// MARK: - Private
private extension CLI {
    
}
