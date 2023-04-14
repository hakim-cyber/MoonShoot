//
//  Mission.swift
//  Moonshoot
//
//  Created by aplle on 3/6/23.
//

import Foundation



struct Mission :Codable,Identifiable{
    struct Crewrole:Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [Crewrole]
    let description: String
    
    
    var displayName:String{
        "Apollo\(id)"
    }
    var image:String{
        "apollo\(id)"
    }
    var formattedLaunchDate:String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
