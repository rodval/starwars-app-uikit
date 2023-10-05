//
//  NetworkConfiguration.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import Foundation
import Combine

protocol RequestType {
    var builder: NetworkRequesterType { get }
}

protocol NetworkRequesterType {
    func performRequest() -> AnyPublisher<Data, Error>
}
