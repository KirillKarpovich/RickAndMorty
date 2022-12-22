//
//  CharactersResponse.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import Foundation

struct CharactersResponse: Decodable {
    let results: [Card]
}
