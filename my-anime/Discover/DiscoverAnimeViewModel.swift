//
//  DiscoverAnimeViewModel.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine

class DiscoverAnimeViewModel: ObservableObject {
    @Published var animeList: [AnimeViewModel] = []
    var hasMoreRows = true

    private let repository: AnimeRepository
    private var animeSubscription: AnyCancellable?
    
    init(repository: AnimeRepository = AnimeNetworkRepository.shared) {
        self.repository = repository
        
//        fetchMore()
    }
    
//    func fetchMore() {
//        animeSubscription = AnimeNetworkRepository.shared.fetch()
//            .receive(on: RunLoop.main)
//            .sink { completion in
//            switch completion {
//            case .finished:
//                break
//            case .failure(let error):
//                print(error)
//            }
//            return
//        } receiveValue: { [weak self] animes in
//            self?.animeList.append(contentsOf: animes.map { AnimeViewModel($0) } )
//        }
//    }
}
