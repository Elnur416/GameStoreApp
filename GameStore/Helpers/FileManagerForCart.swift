//
//  FileManagerForCart.swift
//  GameStore
//
//  Created by Elnur Mammadov on 07.01.25.
//

import Foundation

class FileManagerForCart {
    enum FileManagerName: String {
        case cart = "Cart.json"
        case wishlist = "Wishlist.json"
        case collection = "Collection.json"
    }
    func getPath(fileName: FileManagerName) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent(fileName.rawValue)
        //        print(path)
        return path
    }
    
    func readData(fileName: FileManagerName, completion: (([GameForCart]) -> Void)) {
        if let data = try? Data(contentsOf: getPath(fileName: fileName)) {
            do {
                let games = try JSONDecoder().decode([GameForCart].self, from: data)
                completion(games)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(fileName: FileManagerName, game: [GameForCart]) {
        do {
            let data = try JSONEncoder().encode(game)
            try? data.write(to: getPath(fileName: fileName))
        } catch {
            print(error.localizedDescription)
        }
    }
}
