//
//  FileManagerForCart.swift
//  GameStore
//
//  Created by Elnur Mammadov on 07.01.25.
//

import Foundation

class FileManagerForCart {
    func getPath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("Games.json")
//        print(path)
        return path
    }
    
    func readData(completion: (([GameForCart]) -> Void)) {
        if let data = try? Data(contentsOf: getPath()) {
            do {
                let games = try JSONDecoder().decode([GameForCart].self, from: data)
                completion(games)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(game: [GameForCart]) {
        do {
            let data = try JSONEncoder().encode(game)
            try? data.write(to: getPath())
        } catch {
            print(error.localizedDescription)
        }
    }
}
