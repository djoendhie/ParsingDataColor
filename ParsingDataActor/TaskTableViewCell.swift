//
//  TaskTableViewCell.swift
//  ParsingDataActor
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
