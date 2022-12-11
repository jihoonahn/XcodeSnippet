import XcodeSnippet

struct snippetEx: Snippet {
    var xcodeSnippet: [XcodeSnippet] = [
        XcodeSnippet(title: "Hello",
                     summary: "Hello",
                     code: "MARK: - <# s#>",
                     language: "Swift",
                     platform: .iOS,
                     completion: "",
                     availability: [.Function_or_Method])
    ]
}

_ = try snippetEx().install()
