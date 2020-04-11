//
//  PrayerTableViewCell.swift
//  QuranApp
//
//  Created by AL Mustakim on 7/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class PrayerTableViewCell: UITableViewCell {

    @IBOutlet weak var prayerName: UILabel!
    @IBOutlet weak var prayerTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
