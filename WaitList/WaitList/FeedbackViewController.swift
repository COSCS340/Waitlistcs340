//
//  FeedbackViewController.swift
//  WaitList
//
//  Created by Ben Chesney on 2/16/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var enterFeedback: UITextField!
    @IBOutlet weak var userFeedback: UITextView!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender: Any) {
        userFeedback.text = enterFeedback.text
        
    }
    
    var pressed1 = false
    var pressed2 = false
    var pressed3 = false
    var pressed4 = false
    var pressed5 = false
    
    @IBAction func star1f(_ sender: UIButton) {
        if(pressed1 == false){
            star1.setImage(UIImage(named: "orangestar"), for: .normal)
            pressed1 = true;
        }else{
            star1.setImage(UIImage(named: "whitestar"), for: .normal)
            star2.setImage(UIImage(named: "whitestar"), for: .normal)
            star3.setImage(UIImage(named: "whitestar"), for: .normal)
            star4.setImage(UIImage(named: "whitestar"), for: .normal)
            star5.setImage(UIImage(named: "whitestar"), for: .normal)
            pressed1 = false
            pressed2 = false
            pressed3 = false
            pressed4 = false
            pressed5 = false
        }
    }
    
    @IBAction func star2f(_ sender: UIButton) {
        if(pressed2 == false){
            star2.setImage(UIImage(named: "orangestar"), for: .normal)
            star1.setImage(UIImage(named: "orangestar"), for: .normal)
            pressed2 = true
            pressed1 = true
        }else{
            star2.setImage(UIImage(named: "whitestar"), for: .normal)
            star3.setImage(UIImage(named: "whitestar"), for: .normal)
            star4.setImage(UIImage(named: "whitestar"), for: .normal)
            star5.setImage(UIImage(named: "whitestar"), for: .normal)
            pressed2 = false
            pressed3 = false
            pressed4 = false
            pressed5 = false
        }
    }
    
    @IBAction func star3f(_ sender: UIButton) {
        if(pressed3 == false){
            star3.setImage(UIImage(named: "orangestar"), for: .normal)
            star2.setImage(UIImage(named: "orangestar"), for: .normal)
            star1.setImage(UIImage(named: "orangestar"), for: .normal)
            pressed3 = true;
            pressed2 = true
            pressed1 = true
        }else{
            star3.setImage(UIImage(named: "whitestar"), for: .normal)
            star4.setImage(UIImage(named: "whitestar"), for: .normal)
            star5.setImage(UIImage(named: "whitestar"), for: .normal)
            pressed3 = false
            pressed4 = false
            pressed5 = false
        }
    }
    
    @IBAction func star4f(_ sender: UIButton) {
        if(pressed4 == false){
            star4.setImage(UIImage(named: "orangestar"), for: .normal)
            star3.setImage(UIImage(named: "orangestar"), for: .normal)
            star2.setImage(UIImage(named: "orangestar"), for: .normal)
            star2.setImage(UIImage(named: "orangestar"), for: .normal)
            star1.setImage(UIImage(named: "orangestar"), for: .normal)
            pressed4 = true;
            pressed3 = true
            pressed2 = true
            pressed1 = true
        }else{
            star4.setImage(UIImage(named: "whitestar"), for: .normal)
            star5.setImage(UIImage(named: "whitestar"), for: .normal)
            pressed4 = false
            pressed5 = false
        }
    }
    
    @IBAction func star5f(_ sender: UIButton) {
        if(pressed5 == false){
            star5.setImage(UIImage(named: "orangestar"), for: .normal)
            star4.setImage(UIImage(named: "orangestar"), for: .normal)
            star3.setImage(UIImage(named: "orangestar"), for: .normal)
            star2.setImage(UIImage(named: "orangestar"), for: .normal)
            star1.setImage(UIImage(named: "orangestar"), for: .normal)
            pressed5 = true;
            pressed4 = true
            pressed3 = true
            pressed2 = true
            pressed1 = true
        }else{
            star5.setImage(UIImage(named: "whitestar"), for: .normal)
            pressed5 = false
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        enterFeedback.resignFirstResponder()
    }

}
