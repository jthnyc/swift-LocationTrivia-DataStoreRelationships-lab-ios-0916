//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {

    
    var store: LocationsDataStore = LocationsDataStore.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.accessibilityLabel = "Locations Table"
        self.tableView.accessibilityIdentifier = "Locations Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        
        print(store.locations.count)

    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        cell.textLabel?.text = store.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(store.locations[indexPath.row].trivia.count)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationViewController = segue.destination as! TriviaTableViewController
            
            let selectedCell = self.tableView.indexPathForSelectedRow?.row
            
            if let unwrappedRow = selectedCell {
                destinationViewController.location = self.store.locations[unwrappedRow]
            }
        }        
    }
    

}
