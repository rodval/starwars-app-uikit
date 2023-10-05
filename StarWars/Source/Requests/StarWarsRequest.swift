//
//  StarWarsRequest.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import Foundation

enum StarWarsRequest {
    case getStarWarsCharacter
    case getImage(url: String)
}

extension StarWarsRequest: RequestType {
    var builder: NetworkRequesterType {
        switch self {
        case .getStarWarsCharacter:
            
            return QueryRequester(urlString: "https://raw.githubusercontent.com/phunware/dev-interview-homework/master/feed.json")
        case let .getImage(url):
            
            return QueryRequester(urlString: url)
        }
    }
}
