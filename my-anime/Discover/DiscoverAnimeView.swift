//
//  DiscoverAnimeView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct DiscoverAnimeView: View {
    @ObservedObject var viewModel = DiscoverAnimeViewModel()
    
    var body: some View {
        NavigationView{
            VStack (spacing: 0) {
                TrendingView()
                List {
                    ForEach(viewModel.animeList) { anime in
                        DiscoverAnimeItemView(vm: anime)
                    }
                    
                    if self.viewModel.hasMoreRows {
                        Text("Fetching more...")
                            .onAppear(perform: {
                                self.viewModel.fetchMore()
                            })
                    }
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Discover")
            }
        }
    }
}

#if DEBUG
struct DiscoverAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverAnimeView(viewModel: DiscoverAnimeViewModelPreviewMock())
    }
}
#endif
