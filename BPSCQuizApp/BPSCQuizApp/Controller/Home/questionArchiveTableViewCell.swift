//
//  questionArchiveTableViewCell.swift
//  BPSCQuizApp
//
//  Created by Arika Afrin Boshra on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class questionArchiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionArchiveLabel: UILabel!
    @IBOutlet weak var questionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
