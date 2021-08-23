//
//  FeaturedView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct SliderView: View {
    @ObservedObject var viewModel: SliderAnimeViewModel
    var body: some View {
        ZStack {
            Color.init(Constants.Color.primaryColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading, spacing: 0) {
                Text(viewModel.title)
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                        
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (spacing: 12){
                        ForEach(viewModel.animes) { animeViewModel in
                            SliderItemView(viewModel: animeViewModel)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#if DEBUG
struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(viewModel: SliderAnimeViewModelPreviewMock(type: .trending))
    }
}
#endif
