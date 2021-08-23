//
//  FeaturedItemView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct SliderItemView: View {
    @ObservedObject var viewModel: AnimeViewModel
    var body: some View {
        VStack (alignment: .leading) {
            Image(uiImage: viewModel.smallPosterImage)
                .resizable()
                .frame(width: 140, height: 210)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5.0)
                .onAppear {
                    viewModel.fetchPosterImage(size: .small)
                }
            Text(viewModel.anime.title)
                .bold()
            Spacer()
        }
        .frame(width: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        let anime = SliderAnimeViewModelPreviewMock(type: .trending).animes[0]
        SliderItemView(viewModel: anime)
    }
}
