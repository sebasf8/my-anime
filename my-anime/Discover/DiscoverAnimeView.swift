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
            ZStack {
                Color.init(Constants.Color.primaryColor)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{

                VStack (alignment: .leading, spacing: 0) {
                    Text("Discover")
                        .font(.largeTitle)
                        .bold()
                        .padding([.leading, .top])
                    SliderView(viewModel: SliderAnimeViewModel(type: .trending))
                    SliderView(viewModel: SliderAnimeViewModel(type: .category(name: "Comedy")))
                    SliderView(viewModel: SliderAnimeViewModel(type: .category(name: "Romace")))
                    
                }
                .foregroundColor(Color(Constants.Color.primaryTextColor))
                
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
