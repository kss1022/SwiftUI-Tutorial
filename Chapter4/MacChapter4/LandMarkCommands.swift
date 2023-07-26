//
//  LandMarkCommands.swift
//  MacChapter4
//
//  Created by 한현규 on 2023/07/26.
//

import SwiftUI


struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark


    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}


private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<LandMark>
}


extension FocusedValues {
    var selectedLandmark: Binding<LandMark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
