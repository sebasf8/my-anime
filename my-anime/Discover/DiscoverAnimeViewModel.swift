//
//  DiscoverAnimeViewModel.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine
import UIKit.UIImage

class DiscoverAnimeViewModel: ObservableObject {
    @Published var animeList: [AnimeViewModel] = []
    
    private let repository: AnimeRepository
    private var animeSubscription: AnyCancellable?
    
    init(repository: AnimeRepository = AnimeNetworkRepository.shared) {
        self.repository = repository
        
        fetchAnimeList()
    }
    
    private func fetchAnimeList() {
        animeSubscription = AnimeNetworkRepository.shared.fetch()
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
            self?.animeList = animes.map { AnimeViewModel($0) }
        }
    }
}

class AnimeViewModel: ObservableObject, Identifiable {
    @Published var smallPosterImage: UIImage = UIImage()
    let anime: Anime
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(_ anime: Anime) {
        self.anime = anime
    }
    
    func fetchPosterImage(size: PosterSize) {
        guard let url = anime.poster[size] else { return }
        
        ImageNetworkRepository.shared.fetch(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
            return
        } receiveValue: { [weak self] data in
            self?.smallPosterImage = UIImage(data: data) ?? UIImage()
        }.store(in: &subscriptions)
    }
    
}
