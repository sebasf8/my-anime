//
//  ContentView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DiscoverAnimeViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.animeList) { anime in
                DiscoverAnimeItemView(vm: anime)
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: DiscoverAnimeViewModelPreviewMock())
    }
}
