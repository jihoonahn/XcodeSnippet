import Foundation

enum AvailabilityType: String {
    case All_Scopes
    case Class_Implementation
    case Code_Expression
    case Function_or_Method
    case String_or_Comment
    case Top_Level
}

extension AvailabilityType: CustomStringConvertible {
    var description: String {
        switch self {
        case .All_Scopes:
            return "All"
        case .Class_Implementation:
            return "ClassImplementation"
        case .Code_Expression:
            return "CodeExpression"
        case .Function_or_Method:
            return "CodeBlock"
        case .String_or_Comment:
            return "StringOrComment"
        case .Top_Level:
            return "TopLevel"
        }
    }
}
