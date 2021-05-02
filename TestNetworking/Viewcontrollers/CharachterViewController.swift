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
    }

    
}

