//
//  FeaturedAnimeViewModel.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

enum SliderType {
    case trending
    case category(name: String)
}

extension SliderType {
    var title: String {
        get {
            switch self {
            case .trending:
                return "Trending"
            case .category(let title):
                return title
            }
        }
    }
}

class SliderAnimeViewModel: ObservableObject {
    @Published var animes: [AnimeViewModel] = []
    var title: String { type.title }
    
    private let type: SliderType
    private let repository: AnimeRepository
    private var trendingSubscription: AnyCancellable?
    
    init(type: SliderType, repository: AnimeRepository = AnimeNetworkRepository.shared) {
        self.repository = repository
        self.type = type
        fetch()
    }
    
    private func fetch() {
        trendingSubscription = repository.fetch(options: AnimeFetchOptions(categoryFilter: type))
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
            return
        } receiveValue: { [weak self] animes in
            self?.animes =  animes.map { AnimeViewModel($0) }
        }
    }
}
