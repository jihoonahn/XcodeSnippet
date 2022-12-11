import Foundation
import Dispatch
import Files

public protocol Snippet {
    var xcodeSnippet: [XcodeSnippet] { get }
}

// MARK: - public
public extension Snippet {
    func install() throws -> Self {
        let folder = try Folder(path: "~/Library/Developer/Xcode/UserData/CodeSnippets")
        let semaphore = DispatchSemaphore(value: 0)
        var result: Result<Self, Error>?
        let completionHandler = { result = $0 }

        Task {
            do {
                try xcodeSnippet.forEach {
                    try $0.generateSnippet(folder: folder)
                }
                completionHandler(.success(self))
            } catch {
                completionHandler(.failure(error))
            }
        }
        semaphore.wait()
        return try result!.get()
    }
}
