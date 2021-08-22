//
//  ImageRepository.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

protocol ImageRepository {
    func fetch(url: String) -> AnyPublisher<Data, Error>
}

class ImageNetworkRepository: ImageRepository {
    static let shared: ImageRepository = ImageNetworkRepository()
    private var cache: Dictionary<URL, Data> = [:]
    
    private init() {}

    func fetch(url: String) -> AnyPublisher<Data, Error> {
        // FIXME: corregir esto
        let url = URL(string: url)!
        
        if let dataImage = cache[url] {
            return Just(dataImage)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return URLSession.shared.dataTaskPublisher(for: url)
                .mapError{ $0 }
                .map {
                    self.cache[url] = $0.data
                    return $0.data
                }
                .eraseToAnyPublisher()
        }
    }
    
}
