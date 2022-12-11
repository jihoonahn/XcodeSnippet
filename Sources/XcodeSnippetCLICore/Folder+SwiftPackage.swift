import Files

extension Folder {
    func existenceSwiftPackage() throws {
        guard containsFile(named: "Package.swift") else {
            throw CLIError.notASwiftPackage
        }
    }
}
