//
//  RestaurantTableViewCell.swift
//  WaitList
//
//  Created by Avie Desai on 3/23/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var myname: UILabel!
    
    @IBOutlet weak var actualtimeLabel: UILabel!
    
    @IBOutlet weak var checkinButton: MyButton!
    
    @IBAction func checkinButtonTap(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
