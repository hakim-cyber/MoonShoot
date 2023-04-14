//
//  ContentView.swift
//  Moonshoot
//
//  Created by aplle on 3/6/23.
//

import SwiftUI



struct ContentView: View {
    let astronouts:[String:Astronout] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @AppStorage("showGrid") private var showGrid = true
   
    var body: some View {
        NavigationView{
            Group{
                if showGrid {
                    GridView()
                    
                }else{
                    ListView()
                    
                }
            }
            .toolbar {
                          Button {
                              showGrid.toggle() // Toggles showingGrid to false or true
                          } label: {
                              if showGrid {
                                  Label("Show as table", systemImage: "list.dash")
                              } else {
                                  Label("Show as grid", systemImage: "square.grid.2x2")
                              }
                          }
                          .accessibilityLabel("Change view type")
                      }
            .navigationTitle("MoonShoot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

