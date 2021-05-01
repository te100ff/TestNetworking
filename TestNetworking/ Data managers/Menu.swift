//
//  Menu.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var delegate: AlertDelegate!
    
    func fetchCharachterData(source: URLList, completionHandler: @escaping (Charachter) -> Void) {
        guard let url = URL(string: source.rawValue) else {
            self.delegate.failedURLAlert()
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let charachter = try JSONDecoder().decode(Charachter.self, from: data)
                self.delegate.successAlert()
                completionHandler(charachter)
            } catch let error {
                self.delegate.failedDecodeAlert()
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    private init() {}
    
}


