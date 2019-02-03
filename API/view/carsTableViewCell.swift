//
//  carsTableViewCell.swift
//  API
//
//  Created by Ahmed abu elregal on 11/10/18.
//  Copyright © 2018 Ahmed abu elregal. All rights reserved.
//

import UIKit

class carsTableViewCell: UITableViewCell {
    @IBOutlet weak var lableId: UILabel!
    
    @IBOutlet weak var lableName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
