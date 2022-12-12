import Foundation
import Dispatch
import Files

public protocol Snippet {
    var xcodeSnippet: [XcodeSnippet] { get }
}

// MARK: - public
public extension Snippet {
    func install() throws -> Void  {
        let folder = try Folder(path: "~/Library/Developer/Xcode/UserData/CodeSnippets")
        let semaphore = DispatchSemaphore(value: 0)
        var result: Result<Void, Error>?
        let completionHandler = { result = $0 }

        Task {
            do {
                try xcodeSnippet.forEach {
                    try $0.generateSnippet(folder: folder)
                }
                completionHandler(.success)
            } catch {
                completionHandler(.failure(error))
            }
        }
        semaphore.wait()
        return try result!.get()
    }
}

// MARK: - Private Extension
private extension Result where Success == Void {
    static var success: Result { .success(()) }
}
