//
//  Chatachter.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//


struct Charachter: Decodable {
    let name: String?
    let culture: String?
    let titles: [String]?
    let playedBy: [String]?
    
    var description: String {
        """
        Name: \(name ?? "unknown")
        
        Culture: \(culture ?? "unknown")
        
        Titles: \(titles?.joined(separator: ",") ?? "unknown")
        
        Actor: \(playedBy?.joined(separator: ",") ?? "unknown")
        """
    }
    
}


