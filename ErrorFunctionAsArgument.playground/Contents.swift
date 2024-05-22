import Foundation

import UIKit

enum FileError: Error {
    case fileNotFound
    case inValidJSON
}

func readFile(_ path: URL) throws -> Any {
    do {
        // Attempt to read the file contents
        let data = try Data(contentsOf: path)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
        return json

    } catch  let error as NSError {
        // Wrap error and add context
        switch error.code {
        case 3840:
            throw FileError.inValidJSON
        default:
            throw FileError.fileNotFound
        }
    }
}

func runOperation(operation: (Any) throws -> Void, errorHandler: (Error) -> Void) {
    do {
        guard let fileUrl = Bundle.main.url(forResource: "textFile", withExtension: "json") else {
            return errorHandler(FileError.fileNotFound);
        }
        try readFile(fileUrl)
    } catch {
        errorHandler(error)
    }
}

func errorHandler(error: Error) {
    switch error {
    case FileError.fileNotFound:
        print(error)
    case FileError.inValidJSON:
        print(error)
    default:
        print(error)
    }
}

func processFile(json: Any) {
   print("success",json)
}

runOperation(operation: processFile, errorHandler: errorHandler)
