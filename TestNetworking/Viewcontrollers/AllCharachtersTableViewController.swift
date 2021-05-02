//
//  AllCharachtersTableViewController.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 01.05.2021.
//

import UIKit

class AllCharachtersTableViewController: UITableViewController {
    
   var charachters: [TableCharachter] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charachters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! AllCharachtersCell

        let charachter = charachters[indexPath.row]
        cell.setup(with: charachter)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
}


