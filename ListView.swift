//
//  ListView.swift
//  Moonshoot
//
//  Created by aplle on 3/8/23.
//

import Foundation
import SwiftUI
struct ListView: View {
    let astronauts:[String:Astronout] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        List(missions) { mission in
                   NavigationLink {
                       MissionView(mission: mission, astronouts: astronauts)
                   } label: {
                       
                       HStack {
                           Image(systemName: "circle.fill")
                               .resizable()
                               .frame(width: 10,height: 10)
                           Image(mission.image)
                               .resizable()
                               .scaledToFit()
                               .frame(width: 40, height: 40)
                               .padding()
                           
                           VStack(alignment: .leading) {
                               Text(mission.displayName)
                                   .font(.headline)
                               
                               Text(mission.formattedLaunchDate)
                           }
                       }
                   }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("\(mission.displayName)")
                .accessibilityHint("Launch Date \(mission.formattedLaunchDate)")
                   .border(.lightBackground)
                   .cornerRadius(30)
                   .listRowBackground(Color.darkBackground) // Sets our custom dark background color as background for the list
               }
               .listStyle(.plain) // Makes the list take the full width of the screen
           }
        
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.dark)
    }
}
