//
//  Model.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import Foundation

class NetworkManager {
    
    func getData(completion: @escaping ([Card]) -> Void) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CharactersResponse.self, from: data!)
//                response.results.first?.name
                completion(response.results)
            }
            catch {
                print (error)
            }
        }
        dataTask.resume()
    }
}
