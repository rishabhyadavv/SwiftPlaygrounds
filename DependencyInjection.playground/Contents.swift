import UIKit

// Incorrect implementation violating SRP
class FileManagerError {
    func saveData() {
        // Code to save data to a file
    }
    
    func processData() {
        // Code to process data
    }
}

protocol FileSaveService {
    func saveData()
}

protocol FileProccesingService {
    func processData()
}
// Incorrect implementation violating SRP
class FileManager: FileSaveService, FileProccesingService {
    func saveData() {
        // Code to save data to a file
    }
    
    func processData() {
        // Code to process data
    }
}

