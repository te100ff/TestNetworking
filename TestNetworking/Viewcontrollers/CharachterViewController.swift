//
//  CharachterViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//

import UIKit

class CharachterViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    var charachter: Charachter!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.isHidden = true
        
        //mainLabel.text = charachter!.description
    }
    
//    func fetchData(source: URLList) {
//        guard let url = URL(string: source.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No description")
//                return
//        }
//
//            do {
//                self.charachter = try JSONDecoder().decode(Charachter.self, from: data)
//
//                DispatchQueue.main.async {
//                    self.mainLabel.text = self.charachter.description
//                    self.reloadInputViews()
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//
//    }.resume()
//
//   }

}
//DispatchQueue.main.async {
//    self.mainLabel.text = self.charachter.description
//    self.reloadInputViews()
//}
