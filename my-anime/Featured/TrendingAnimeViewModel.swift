//
//  FeaturedAnimeViewModel.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

class TrendingAnimeViewModel: ObservableObject {
    @Published var trending: [AnimeViewModel] = []
    
    private var repository: AnimeRepository
    private var trendingSubscription: AnyCancellable?
    
    init(repository: AnimeRepository = AnimeNetworkRepository.shared) {
        self.repository = repository
        fetchFeatured()
    }
    
    private func fetchFeatured() {
        trendingSubscription = repository.fetchTrending()
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
            self?.trending =  animes.map { AnimeViewModel($0) }
        }
    }
}
