//
//  NotificationView.swift
//  WatchChatper4 Watch App
//
//  Created by 한현규 on 2023/07/26.
//

import SwiftUI

struct NotificationView: View {
    
    var title : String?
    var message : String?
    var landMark : LandMark?
    
    
    var body: some View {
        VStack{
            if landMark != nil{
                CircleImage(image: landMark!.image.resizable())
                    .scaledToFit()
            }
            
            
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)


            Divider()


            Text(message ?? "You are within 5 miles of one of your fwavorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landMark: ModelData().landMarks[0])
        }
    }
}
