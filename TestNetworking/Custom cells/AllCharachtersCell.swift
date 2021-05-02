//
//  AllCharachtersCell.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 01.05.2021.
//

import UIKit

class AllCharachtersCell: UITableViewCell {
    
    @IBOutlet weak var charachterFullname: UILabel!
    @IBOutlet weak var charachterTitle: UILabel!
    @IBOutlet weak var charachterFamily: UILabel!
    
    @IBOutlet weak var charachterImage: UIImageView!
    
    func setup(with charachter: TableCharachter) {
        charachterFullname.text = charachter.fullName
        charachterTitle.text = "Title: \(charachter.title ?? "Unknown")"
        charachterFamily.text = "Family: \(charachter.family ?? "Unknown")"
        
        guard let url = URL(string: charachter.imageUrl ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.charachterImage.image = UIImage(data: image)
            }
        }
    }
}


