//
//  LandmarkList.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: LandMark?


    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"


        var id: FilterCategory { self }
    }

    
    var filteredList : [LandMark]{
        modelData.landMarks.filter { landMark in
            (!showFavoritesOnly || landMark.isFavorite)
            && (filter == .all || filter.rawValue == landMark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }


    var index: Int? {
        modelData.landMarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark){
                ForEach(filteredList) { landMark in
                    NavigationLink {
                        LandMarkDetailView(landMark: landMark)
                    } label: {
                        LandmarkRow(landmark: landMark)
                    }
                    .tag(landMark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem{
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landMarks[index ?? 0])

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
