//
//  GridView.swift
//  Moonshoot
//
//  Created by aplle on 3/8/23.
//

import Foundation
import SwiftUI
struct GridView:View{
    let astronouts:[String:Astronout] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns:columns){
                ForEach(missions) { mission in
                    NavigationLink{
                        MissionView(mission: mission, astronouts: astronouts)
                    }label: {
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .padding()
                            
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightBackground)
                        )
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("\(mission.displayName)")
                    .accessibilityHint("Launch Date \(mission.formattedLaunchDate)")
                }
               
                
            }
            .padding([.horizontal,.bottom])
        }
        
    }
}
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .preferredColorScheme(.dark)
    }
}
