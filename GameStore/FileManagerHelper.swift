//
//  FileManagerHelper.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import Foundation

class FileManagerHelper {
    func getPath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("User.json")
//        print(path)
        return path
    }
    
    func readData(completion: (([User]) -> Void)) {
        if let data = try? Data(contentsOf: getPath()) {
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            try? data.write(to: getPath())
        } catch {
            print(error.localizedDescription)
        }
    }
}
