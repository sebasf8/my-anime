//
//  AnimeRepository.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

protocol AnimeRepository {
    func fetch() -> AnyPublisher<[Anime], Error>
}

struct AnimeResponse: Codable {
    let data: [AnimeItemResponse]
}

struct AnimeItemResponse: Codable {
    let id: String
    let attributes: AnimeAttributes
}

struct AnimeAttributes: Codable {
    let synopsis: String
    let titles: [String: String]
    let canonicalTitle: String
    let favoritesCount: Int
    let status: String
    let posterImage: PosterImage
    let episodeCount: Int
}

struct PosterImage: Codable {
    let tiny: String
    let small: String
    let medium: String
    let large: String
}


struct AnimeNetworkRepository: AnimeRepository {
    static let shared: AnimeRepository = AnimeNetworkRepository()
    
    private init() {}
    
    func fetch() -> AnyPublisher<[Anime], Error> {
        guard let url = URL(string: "\(Constants.API.baseURL)/anime") else {
            fatalError("Valid URL should be provided")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: AnimeResponse.self, decoder: JSONDecoder())
            .map { response in
                response.data.map {
                    let urlsPosterSizes = $0.attributes.posterImage
                    
                    return Anime(id: $0.id,
                          title: $0.attributes.canonicalTitle,
                          synopsis: $0.attributes.synopsis,
                          favourite: false,
                          poster: [.tiny: urlsPosterSizes.tiny,
                                   .small: urlsPosterSizes.small,
                                   .medium: urlsPosterSizes.medium,
                                   .large: urlsPosterSizes.large])
                }
            }.eraseToAnyPublisher()
    }
}
