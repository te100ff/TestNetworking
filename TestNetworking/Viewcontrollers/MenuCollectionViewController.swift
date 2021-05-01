//
//  MenuCollectionViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//

import UIKit

protocol AlertDelegate {
    func successAlert()
    func failedDecodeAlert()
    func failedURLAlert()
}

private let reuseIdentifier = "Cell"

class MenuCollectionViewController: UICollectionViewController {
    
    private let menuItems = MenuItems.allCases
    private var selectedChatachter: URLList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "charachter" {
            guard let charachterVC = segue.destination as? CharachterViewController else { return }
            guard let selected = selectedChatachter else { return }
            
            NetworkManager.shared.fetchCharachterData(source: selected) { charachter in
                charachterVC.charachter = charachter
                DispatchQueue.main.async {
                    charachterVC.mainLabel.text = charachterVC.charachter.description
                    charachterVC.mainLabel.isHidden.toggle()
                    charachterVC.reloadInputViews()
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MenuViewCell
        cell.menuLabel.text = menuItems[indexPath.item].rawValue
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItemSelected = menuItems[indexPath.item]
        
        switch menuItemSelected {
        case .aboutBook: performSegue(withIdentifier: "bookDescription", sender: nil)
        case .jonSnow:
            selectedChatachter = .jonSnow
            performSegue(withIdentifier: "charachter", sender: nil)
        case .daenerys:
            selectedChatachter = .daenerys
            self.performSegue(withIdentifier: "charachter", sender: nil)
            
        case .urlErrorAlert:
            selectedChatachter = .urlErrorAlert
            self.performSegue(withIdentifier: "charachter", sender: nil)
        case .decodeErrorAlert:
            selectedChatachter = .decodeErrorAlert
            self.performSegue(withIdentifier: "charachter", sender: nil)
        }
        
    }
    
    
}

extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
}


// MARK: - Alert controller setup
extension MenuCollectionViewController: AlertDelegate {
    func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "Data recieved",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    func failedDecodeAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "Wrong data from source",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    func failedURLAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "Wrong URL adress",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}
