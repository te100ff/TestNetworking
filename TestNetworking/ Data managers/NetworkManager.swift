//
//  Menu.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//
import Foundation

enum Failure: Error {
    case wrongURL
    case decodeFailed
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchCharachterData(source: URLList, completionHandler: @escaping (Result<Charachter, Failure>) -> Void) {
        
        guard let url = URL(string: source.rawValue) else {
            completionHandler(.failure(.wrongURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else { return }
            
            do {
                let charachter = try JSONDecoder().decode(Charachter.self, from: data)
                completionHandler(.success(charachter))
            } catch let error {
                completionHandler(.failure(.decodeFailed))
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchAllCharachters(source: URLList, completionHandler: @escaping ([TableCharachter]) -> Void) {
        
        guard let url = URL(string: source.rawValue) else {
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let fullList = try JSONDecoder().decode([TableCharachter].self, from: data)
                completionHandler(fullList)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private init() {}
    
}



