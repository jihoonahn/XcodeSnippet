enum CLIError: Error {
    case newProjectFolderNotEmpty
    case notASwiftPackage
}

extension CLIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .newProjectFolderNotEmpty:
            return "New projects can only be generated in empty folders."
        case .notASwiftPackage:
            return "The current folder is not a Swift package."
        }
    }
}
