//
//  TableViewCell.swift
//  SplitViewController
//
//  Created by Sunitha Balasubramanian on 24/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
