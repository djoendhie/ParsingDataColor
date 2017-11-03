//
//  TaskTableViewCell.swift
//  ParsingDataColor
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var labelColor: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
