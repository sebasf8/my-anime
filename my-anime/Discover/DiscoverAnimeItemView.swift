//
//  DiscoverAnimeItem.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct DiscoverAnimeItemView: View {
    @ObservedObject var vm: AnimeViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: vm.smallPosterImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 63, height: 90, alignment: .center)
                .onAppear {
                    vm.fetchPosterImage(size: .small)
                }
            VStack (alignment: .leading){
                Text(vm.anime.title)
                    .font(.title2)
                    .lineLimit(1)
                Text(vm.anime.synopsis)
                    .lineLimit(3)
                Spacer()
            }
        }
    }
}

#if DEBUG
struct DiscoverAnimeItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        let anime = DiscoverAnimeViewModelPreviewMock().animeList[0]
        DiscoverAnimeItemView(vm: anime)
            .previewLayout(.fixed(width: 400.0, height: 100.0))
    }
}
#endif

