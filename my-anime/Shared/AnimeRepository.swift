//
//  AnimeRepository.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

protocol AnimeRepository {
    func fetch(options: AnimeFetchOptions) -> AnyPublisher<[Anime], Error>
}

struct AnimeFetchOptions {
    var categoryFilter: SliderType
    
    var url: URL {
        switch categoryFilter {
        case .trending:
            return URL(string: "\(Constants.API.baseURL)/trending/anime")!
        default:
            return URL(string: "\(Constants.API.baseURL)/anime")!
        }
    }
}

struct AnimeResponse: Codable {
    let data: [AnimeItemResponse]
    let links: Links?
}

struct AnimeItemResponse: Codable {
    let id: String
    let attributes: AnimeAttributes
}

struct Links: Codable {
    let next: String
}

struct AnimeAttributes: Codable {
    let synopsis: String
    let titles: [String: String]
    let canonicalTitle: String
    let favoritesCount: Int
    let status: String
    let posterImage: PosterImage
    let episodeCount: Int?
}

struct PosterImage: Codable {
    let tiny: String
    let small: String
    let medium: String
    let large: String
}


class AnimeNetworkRepository: AnimeRepository {
    static let shared: AnimeRepository = AnimeNetworkRepository()
    
    private init() {}
    
//    func fetch(options: AnimeFetchOptions) -> AnyPublisher<[Anime], Error> {
//        guard let url = URL(string: nextPage) else {
//            fatalError("Valid URL should be provided")
//        }
//
//        return fetch(url: url)
//    }

    public func fetch(options: AnimeFetchOptions) -> AnyPublisher<[Anime], Error> {
        let url = addURLParameters(to: options.url, with: options)
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: AnimeResponse.self, decoder: JSONDecoder())
            .map { dataResponse in
                
                return dataResponse.data.map {
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
    
    private func addURLParameters(to url: URL, with options: AnimeFetchOptions) -> URL {
        guard case .category(let name) = options.categoryFilter else { return url }
        
        return url.appendingPathComponent("?filer[category]=\(name)")
    }

}
