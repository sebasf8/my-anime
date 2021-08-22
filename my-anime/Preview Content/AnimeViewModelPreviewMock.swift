//
//  File.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import UIKit.UIImage


class AnimeViewModelPreviewMock: AnimeViewModel {
    override init(_ anime: Anime) {
        super.init(anime)
        smallPosterImage = UIImage(named: "anime-poster")!
    }
    
    override func fetchPosterImage(size: PosterSize) {
        return
    }
}
