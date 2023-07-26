//
//  ProfileSummary.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct ProfileSummary: View {
    
    let profile : Profile
    
    var body: some View {

        VStack(alignment: .leading, spacing: 20.0) {
                        
            VStack(alignment: .leading, spacing: 10.0) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
                                    
            
            Divider()
            
            VStack(alignment: .leading){
                
                Text("Complete Badge")
                    .font(.headline)
                
                ScrollView(.horizontal){
                    HStack{
                        HikeBadge(name: "FirstHike")
                        HikeBadge(name: "SecondHike")
                            .hueRotation(Angle(degrees: 90.0))
                        HikeBadge(name: "ThirdHike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
            }
            
            Divider()
            
            VStack(alignment: .leading){
                Text("Recent Hike")
                    .font(.headline)
                
                HikeView(hike: ModelData().hikes[0])
            }
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
