//
//  CheckOutViewController.swift
//  WaitList
//
//  Created by Avie Desai on 3/24/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit
import Firebase

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var haveyouLabel: UILabel!
    
    @IBOutlet weak var whichoneLabel: UILabel!
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    let database = Database.database().reference()
    
    @IBAction func checkoutTap(_ sender: Any) {
        self.database.child("Times").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children
            {
                
                let snap = child as! DataSnapshot
                let name = snap.key
                var minutes = snap.value as? Int
                if(name == checkoutrestaurant)
                {
                    minutes = minutes! - 2
                    self.database.child("Times").child(name).setValue(minutes)
                }
            }
            
            let main = UIStoryboard(name: "Main", bundle: nil)
            let newclass: FeedbackViewController = main.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            self.present(newclass, animated: true, completion: nil)
            
            
        })
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whichoneLabel.text = checkoutrestaurant + "?"
        checkoutButton.setTitleColor(UIColor.black, for: .normal)
        checkoutButton.layer.borderWidth = 2
        checkoutButton.layer.cornerRadius = 15
        checkoutButton.backgroundColor = UIColor.green

        // Do any additional setup after loading the view.
    }

}
