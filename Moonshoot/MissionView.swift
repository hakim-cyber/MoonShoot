//
//  MissionView.swift
//  Moonshoot
//
//  Created by aplle on 3/7/23.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role:String
        let astronout:Astronout
    }
    let mission :Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityHidden(true)
                       
                    Text(mission.formattedLaunchDate)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.headline)
                        .padding(.vertical,3)
                        
                

                        
                    
                    VStack(alignment: .leading){
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                            .foregroundColor(.white)
                        
                        Text(mission.description)
                            .foregroundColor(.white)
                    }
                    .accessibilityElement(children: .combine)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.lightBackground)
                            .accessibilityHidden(true)
                            )
                    .background(.lightBackground)
                    .padding(.horizontal)
                    
                    
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(crew,id: \.role) { crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronout)
                                }label: {
                                    HStack{
                                        Image(crewMember.astronout.id)
                                            .resizable()
                                            .frame(width: 104,height: 72)
                                            .clipShape(Capsule())
                                            .overlay{
                                                Capsule()
                                                    .strokeBorder(.darkBackground,lineWidth: 1)
                                            }
                                        VStack(alignment: .leading){
                                            Text(crewMember.astronout.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .background(.secondary)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.darkBackground)
                                    )
                                    .padding(.horizontal)
                                }
                                .accessibilityElement(children:.ignore)
                                .accessibilityLabel("\(crewMember.role) \(crewMember.astronout.name)")
                            }
                        }
                       
                    }
                        }
                .padding(.bottom)
            }
            
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronouts:[String:Astronout]) {
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronout = astronouts[member.name]{
                return CrewMember(role: member.role, astronout: astronout)
                
            }else{
                fatalError("Misssing \(member.name)")
            }
        }
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions:[Mission] = Bundle.main.decode("missions.json")
   static let astronauts :[String:Astronout] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronouts: astronauts)
            .preferredColorScheme(.dark)
        
    }
}
