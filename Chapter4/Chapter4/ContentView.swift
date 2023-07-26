//
//  ContentView.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    
    enum Tab {
        case featured
        case list
    }
    
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)
            
            
            LandmarkList()
                .tabItem({
                    Label("Featured", systemImage: "list.dash")
                })
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
