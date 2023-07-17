//
//  RotatedBadgeSybol.swift
//  Chapter2
//
//  Created by 한현규 on 2023/07/17.
//

import SwiftUI

struct RotatedBadgeSybol: View {
    
    let angle : Angle
    
    var body: some View {
        BadgeSybole()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSybol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSybol(angle: Angle(degrees: 5))
    }
}
