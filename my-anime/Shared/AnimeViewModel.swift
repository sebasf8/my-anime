//
//  File.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Combine
import UIKit.UIImage

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
