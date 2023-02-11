import Foundation
import PLCommand
import Files

struct ProjectRunner {
    let folder: Folder
    
    func generate() throws {
        try folder.existenceSwiftPackage()
        PLCommand.Bash.run("cd \(folder.path) && swift run")
    }
}
