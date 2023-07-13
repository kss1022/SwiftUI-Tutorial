//
//  ContentView.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
