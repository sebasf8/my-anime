//
//  FeaturedView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var viewModel = TrendingAnimeViewModel()
    var body: some View {
        VStack (alignment: .leading) {
            Text("Trending")
                .padding(.leading)
                .font(.title2)
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 15) {
                    ForEach(viewModel.trending) { animeViewModel in
                        TrendingItemView(viewModel: animeViewModel)
                    }
                }
                .padding()
            }
        }
    }
}

#if DEBUG
struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView(viewModel: TrendingAnimeViewModelPreviewMock())
    }
}
#endif
