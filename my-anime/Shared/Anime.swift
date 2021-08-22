//
//  Discover.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation

struct Anime: Identifiable {
    let id: String
    
    let title: String
    let synopsis: String
    let favourite: Bool
    let poster: Dictionary<PosterSize, String>
}
