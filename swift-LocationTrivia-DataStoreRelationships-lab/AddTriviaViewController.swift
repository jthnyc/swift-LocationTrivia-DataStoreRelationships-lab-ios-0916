//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Joanna Tzu-Hsuan Huang on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {
    
    var location: Location?

    @IBOutlet weak var triviumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func submitTapped(_ sender: AnyObject) {
        
        let triviumTextField = self.triviumTextField.text!
        
        let newTrivia = Trivium(content: triviumTextField, likes: 0)
        
        location?.trivia.append(newTrivia)
        
//        Location.init().trivia.append(<#T##newElement: Element##Element#>)
//        LocationsDataStore.sharedInstance.locations.append(Location.init(name: , latitude: <#T##Float#>, longitude: <#T##Float#>, trivia: <#T##[Trivium]#>)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        self.dismiss(animated: false, completion: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
