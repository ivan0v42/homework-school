//
//  CustomCell.swift
//  school
//
//  Created by Ivan0v42 on 03.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var photo : UIImageView!
    @IBOutlet var name : UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
