//
//  TVCharacterService.swift
//  Viewer
//
//  Created by Michael Little on 6/12/23.
//

import Foundation
import UIKit

protocol TVCharactersService {
    func fetchTVCharacters() async -> TVCharacters?
    func fetchImage(imageUrlString: String) async throws -> UIImage
}

final class TVCharactersServiceImpl: TVCharactersService {

    public func fetchTVCharacters() async -> TVCharacters? {
        do {
            let urlSession = URLSession.shared
            let url = URL(string: "http://api.duckduckgo.com/?q=the+wire+characters&format=json")
            let (data, _) = try await urlSession.data(from: url!)
            return try JSONDecoder().decode(TVCharacters.self, from: data)
        }
        catch let error {
            debugPrint(error)
        }
    return nil
    }
    
    func fetchImage(imageUrlString: String) async throws -> UIImage {
        do {
            let urlSession = URLSession.shared
            let url = URL(string: imageUrlString)
            let (data, _) = try await urlSession.data(from: url!)
            let returnImage = UIImage(data: data) ?? UIImage()
            return returnImage
        }
        catch let error {
            debugPrint(error)
        }
    return UIImage()
    }
    
}
