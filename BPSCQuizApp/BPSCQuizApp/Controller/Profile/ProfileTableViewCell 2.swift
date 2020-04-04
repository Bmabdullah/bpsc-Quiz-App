//
//  ProfileTableViewCell.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 4/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var progressLabel: UIProgressView!
    @IBOutlet weak var markInPercentage: UILabel!
    @IBOutlet weak var markComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        
       // self.progressLabel.progress = 0.2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
