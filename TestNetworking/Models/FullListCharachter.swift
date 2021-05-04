//
//  FullListCharachter.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 03.05.2021.
//


struct TableCharachter: Decodable {
        let fullName: String?
        let title: String?
        let family: String?
        let imageUrl: String?
    
    init(characterData: [String: Any]) {
        fullName = characterData["fullName"] as? String
        title = characterData["title"] as? String
        family = characterData["family"] as? String
        imageUrl = characterData["imageUrl"] as? String
    }
    
    static func getCharacters(from value: Any) -> [TableCharachter] {
        guard let charactersData = value as? [[String: Any]] else { return [] }
        
        var characters: [TableCharachter] = []
        
        for characterData in charactersData {
            let charachter = TableCharachter(characterData: characterData)
            characters.append(charachter)
        }
        
        return characters
    }
}
