//
//  BookViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: URLList.bookImage.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.mainImage.image = image
            }
        }.resume()
    }
    
}
