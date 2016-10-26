//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    var store = LocationsDataStore.sharedInstance
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        
        let nameField = self.nameField.text!
        let latitudeField = Float(self.latitudeField.text!)
        let longitudeField = Float(self.longitudeField.text!)
        
        LocationsDataStore.sharedInstance.locations.append(Location(name: nameField, latitude: latitudeField!, longitude: longitudeField!))
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        
        self.dismiss(animated: false, completion: nil)
    }
    

}
