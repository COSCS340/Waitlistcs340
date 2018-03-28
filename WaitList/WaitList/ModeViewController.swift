//
//  ModeViewController.swift
//  WaitList
//
//  Created by Avie Desai on 3/28/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit

var devstatus = true

class ModeViewController: UIViewController {
    
    @IBOutlet weak var devLabel: UILabel!
    
    @IBOutlet weak var OnLabel: UILabel!
    
    @IBOutlet weak var toggle: UISwitch!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBAction func homeButtonHit(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let newclass: ViewController = main.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(newclass, animated: true, completion: nil)
    }
    
    
    
    @IBAction func toggleHit(_ sender: Any) {
        if toggle.isOn {
            OnLabel.text = "OFF"
            devstatus = false
            toggle.setOn(false, animated:true)
        } else {
            OnLabel.text = "ON"
            devstatus = true
            toggle.setOn(true, animated:true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(devstatus == false)
        {
            toggle.isOn = false
            OnLabel.text = "OFF"
        }
        else
        {
            toggle.isOn = true
            OnLabel.text = "ON"
        }

        // Do any additional setup after loading the view.
    }

    

}
