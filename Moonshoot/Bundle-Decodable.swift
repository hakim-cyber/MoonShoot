//
//  Bundle-Decodable.swift
//  Moonshoot
//
//  Created by aplle on 3/6/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file : String)-> T {
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("failed to find\(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Failed to load \(file)")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data)else{
            fatalError("Fai;ed to decode \(file)")
        }
        return loaded
    }
}
