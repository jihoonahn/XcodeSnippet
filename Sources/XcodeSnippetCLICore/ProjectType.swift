enum ProjectType: String {
    case snippet
    case plugin
}

extension ProjectType: CustomStringConvertible {
    var description: String {
        switch self {
        case .snippet:
            return "executable"
        case .plugin:
            return "library"
        }
    }
}
