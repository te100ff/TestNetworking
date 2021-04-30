//
//  MenuCollectionViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 30.04.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuCollectionViewController: UICollectionViewController {
    
    let menuItems = MenuItems.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "bookDescription" {
//            guard let bookVC = segue.destination as? BookViewController { return }
//        }
//    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       menuItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MenuViewCell
    
        cell.menuLabel.text = menuItems[indexPath.item].rawValue
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItemSelected = menuItems[indexPath.item]
        
        switch menuItemSelected {

        case .aboutBook: performSegue(withIdentifier: "bookDescription", sender: nil)
        case .jonSnow: print("Jon Snow")
        }
        
    }
    

}

extension MenuCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
}
