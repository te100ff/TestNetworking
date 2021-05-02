//
//  MenuCollectionViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//

import UIKit

class MenuCollectionViewController: UICollectionViewController {
    
    private let menuItems = MenuItems.allCases
    private var selectedItem: URLList?
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "charachter" {
            guard let charachterVC = segue.destination as? CharachterViewController else { return }
            guard let selected = selectedItem else { return }
            
            NetworkManager.shared.fetchCharachterData(source: selected) { result in
                switch result {
                case .success(let charachter):
                    self.successAlert()
                    charachterVC.charachter = charachter
                    DispatchQueue.main.async {
                        charachterVC.mainLabel.text = charachterVC.charachter.description
                        charachterVC.mainLabel.isHidden.toggle()
                        charachterVC.reloadInputViews()
                    }
                case .failure(let error):
                    switch error {
                    case .wrongURL:
                        self.failedURLAlert()
                    case .decodeFailed:
                        self.failedDecodeAlert()
                    }
                }
            }
            
        } else if segue.identifier == "table" {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let allCharachtersVC = navigationVC.topViewController as? AllCharachtersTableViewController else { return }
            guard let selected = selectedItem else { return }
            
            NetworkManager.shared.fetchAllCharachters(source: selected) { allCharachters in
                allCharachtersVC.charachters = allCharachters
                DispatchQueue.main.async {
                    allCharachtersVC.tableView.reloadData()
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
    
    // MARK: - Selected Item logic
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItemSelected = menuItems[indexPath.item]
        
        switch menuItemSelected {
        case .aboutBook: performSegue(withIdentifier: "bookDescription", sender: nil)
        case .jonSnow:
            selectedItem = .jonSnow
            performSegue(withIdentifier: "charachter", sender: nil)
        case .daenerys:
            selectedItem = .daenerys
            self.performSegue(withIdentifier: "charachter", sender: nil)
        case .urlErrorAlert:
            selectedItem = .urlErrorAlert
            self.performSegue(withIdentifier: "charachter", sender: nil)
        case .decodeErrorAlert:
            selectedItem = .decodeErrorAlert
            self.performSegue(withIdentifier: "charachter", sender: nil)
        case .allCharachters:
            selectedItem = .allCharachters
            self.performSegue(withIdentifier: "table", sender: nil)
        }
    }
    
}

extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
}


