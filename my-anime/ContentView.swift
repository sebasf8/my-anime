//
//  ContentView.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.init(Constants.Color.primaryColor)
                .edgesIgnoringSafeArea(.all)
            DiscoverAnimeView()
        }
        .foregroundColor(Color(Constants.Color.primaryTextColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
