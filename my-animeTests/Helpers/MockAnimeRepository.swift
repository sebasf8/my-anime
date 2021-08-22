//
//  MockAnimeRepository.swift
//  Tests iOS
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import Combine
@testable import my_anime


struct MockAnimeRepository: AnimeRepository {
    func fetch() -> AnyPublisher<[Anime], Error> {
        let animes = [
            Anime(id: "1", title: "Cowboy Bebop",
                  synopsis: "In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to keep peace in the galaxy, aided in part by outlaw bounty hunters, referred to as \"Cowboys\". The ragtag team aboard the spaceship Bebop are two such individuals.\nMellow and carefree Spike Spiegel is balanced by his boisterous, pragmatic partner Jet Black as the pair makes a living chasing bounties and collecting rewards. Thrown off course by the addition of new members that they meet in their travels—Ein, a genetically engineered, highly intelligent Welsh Corgi; femme fatale Faye Valentine, an enigmatic trickster with memory loss; and the strange computer whiz kid Edward Wong—the crew embarks on thrilling adventures that unravel each member's dark and mysterious past little by little. \nWell-balanced with high density action and light-hearted comedy, Cowboy Bebop is a space Western classic and an homage to the smooth and improvised music it is named after.\n\n(Source: MAL Rewrite)",
                  favourite: true,
                  poster: [.tiny: "", .small: "", .medium: "", .large: ""])
        ]
        
        return Just(animes)
            .delay(for: 0.5, scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    
}
