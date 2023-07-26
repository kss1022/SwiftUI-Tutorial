//
//  ContentView.swift
//  WatchChatper4 Watch App
//
//  Created by 한현규 on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
