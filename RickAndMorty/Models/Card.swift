//
//  Card.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import Foundation


struct Card: Decodable {
    
    let name: String
    let image: String
    let origin: Name
    let location: Name
    let status: String
    
}

extension Card {
    struct Name: Decodable{
        let name: String
    }
}
