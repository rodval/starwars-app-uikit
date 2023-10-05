//
//  EpisodeListResponse.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import Foundation

struct CharacterResponse : Decodable, Hashable {
    var date: String?
    var description: String?
    var id: Int?
    var image: String?
    var locationline1: String?
    var locationline2: String?
    var timestamp: String?
    var title: String?
}
