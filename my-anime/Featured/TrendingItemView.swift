//
//  FeaturedItemView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct TrendingItemView: View {
    @ObservedObject var viewModel: AnimeViewModel
    var body: some View {
        VStack {
            Image(uiImage: viewModel.smallPosterImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    viewModel.fetchPosterImage(size: .small)
                }
            Text(viewModel.anime.title)
            Spacer()
        }
        .frame(width: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        let anime = TrendingAnimeViewModelPreviewMock().trending[0]
        TrendingItemView(viewModel: anime)
    }
}
