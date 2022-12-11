import Foundation
import Files

struct ProjectGenerate {
    private let folder: Folder
    private let repositoryURL: URL
    private let version: String
    private let type: ProjectType
    private let name: String
    
    public init(folder: Folder,
                repositoryURL: URL,
                version: String,
                type: ProjectType
    ) {
        self.folder = folder
        self.repositoryURL = repositoryURL
        self.version = version
        self.type = type
        self.name = folder.name.description
    }
    
    func generate() throws {
        guard folder.files.first == nil, folder.subfolders.first == nil else {
            throw CLIError.newProjectFolderNotEmpty
        }
        
        try generateGitignore()
        try generatePackageFile()
        
        switch type {
        case .snippet:
            try generateMainFile()
        case .plugin:
            try generatePluginBoilerplate()
        }
    }
}

private extension ProjectGenerate {
    func generateGitignore() throws {
        try folder.createFile(named: ".gitignore").write("""
        .DS_Store
        /build
        /.build
        /.swiftpm
        /*.xcodeproj
        .xcodesnippet
        """)
    }
    
    func generatePackageFile() throws {
        let repositoryURL = repositoryURL.absoluteString
        
        try folder.createFile(named: "Package.swift").write("""
        // swift-tools-version: 5.7
        
        import PackageDescription

        let package = Package(
            name: "\(name)",
            platforms: [.macOS(.v12)],
            products: [
                .\(type.description)(
                    name: "\(name)",
                    targets: ["\(name)"]
                )
            ],
            dependencies: [
                .package(url: "\(repositoryURL)", from: "\(version)")
            ],
            targets: [
                .executableTarget(
                    name: "\(name)",
                    dependencies: ["XcodeSnippet"]
                )
            ]
        )
        """)
    }
    
    func generateMainFile() throws {
        let path = "Source/\(name)/main.swift"
        
        try folder.createFileIfNeeded(at: path).write("""
        import Foundation
        import XcodeSnippet
        
        
        """)
    }
    
    func generatePluginBoilerplate() throws {
        let path = "Sources/\(name)/\(name).swift"
        let methodName = name[name.startIndex].lowercased() + name.dropFirst()
        
        try folder.createFileIfNeeded(at: path).write("""
        import XcodeSnippet
        
        """)
    }
}
