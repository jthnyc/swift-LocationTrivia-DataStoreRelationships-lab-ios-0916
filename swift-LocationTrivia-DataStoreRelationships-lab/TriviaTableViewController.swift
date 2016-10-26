//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {

    
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.accessibilityLabel = "Trivia Table"
        self.tableView.accessibilityIdentifier = "Trivia Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location!.trivia.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)

        let likes = location?.trivia[indexPath.row].likes
        
        cell.textLabel?.text = location?.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(describing: likes)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTrivia" {
            let destinationViewController = segue.destination as! AddTriviaViewController
            
            print("segue to trivia initiated")
            
            destinationViewController.location = self.location
            
            }
        
        
    }

}
