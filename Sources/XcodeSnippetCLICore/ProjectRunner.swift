import Foundation
import ShellOut
import Files

struct ProjectRunner {
    let folder: Folder
    
    func generate() throws {
        try folder.existenceSwiftPackage()
        
        try shellOut(
            to: "swift run",
            at: folder.path,
            outputHandle: FileHandle.standardOutput,
            errorHandle: FileHandle.standardError
        )
    }
}
