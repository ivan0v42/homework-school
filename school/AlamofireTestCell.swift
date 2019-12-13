//
//  AlamofireTestCell.swift
//  school
//
//  Created by Ivan0v42 on 12.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class AlamofireTestCell: UITableViewCell {
      @IBOutlet weak var imageObject: UIImageView?
      @IBOutlet weak var lblName: UILabel?
      @IBOutlet weak var lblDescription: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
