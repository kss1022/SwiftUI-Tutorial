//
//  HikeView.swift
//  Chapter2
//
//  Created by 한현규 on 2023/07/18.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}


struct HikeView: View {
    
    var hike : Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50.0,height: 50.0)
                
                VStack(alignment: .leading){
                    Text(hike.name)
                        .font(.headline)
                    
                    Text(hike.distanceText)
                        .font(.footnote)
                }
                
                Spacer()
                
                Button {
                    //.easeInOut(duration: 4.0)
                    withAnimation{
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                    //.animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1.0)
                        .padding()
                    //.animation(.spring(), value: showDetail)
                }
            }
            
            
            
            if showDetail{
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
            
            Spacer()
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        let hike = ModelData().hikes[0]
        
        VStack{
            HikeView(hike: hike)
                .padding()
            Spacer()
        }
        
        
    }
}
