import UIKit

enum FileError: Error {
    case fileNotFound
    case inValidJSON
}

func readFile(_ path: URL) throws {
    do {
        // Attempt to read the file contents
        let data = try Data(contentsOf: path)
        let json = try JSONSerialization.jsonObject(with: data, options: [])

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

do {
   guard let fileUrl = Bundle.main.url(forResource: "textFile", withExtension: "json") else {
        throw FileError.fileNotFound;
   }
    try readFile(fileUrl)
} catch FileError.fileNotFound {
    print("File not found.")
}
catch FileError.inValidJSON {
    print("JSON data is not valid")
}
catch {
    print("An unexpected error occurred: \(error)")
}
