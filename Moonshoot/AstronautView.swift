//
//  AstronautView.swift
//  Moonshoot
//
//  Created by aplle on 3/8/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronout
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                VStack{
                    Text(astronaut.description)
                        .padding()
                        .foregroundColor(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.lightBackground)
                        )
                .background(.lightBackground)
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts :[String:Astronout] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
