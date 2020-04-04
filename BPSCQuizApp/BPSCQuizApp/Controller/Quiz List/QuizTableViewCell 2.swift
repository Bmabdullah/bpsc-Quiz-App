//
//  QuizTableViewCell.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var qView: UIView!
    @IBOutlet weak var quizTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        contentView.frame = contentView.frame.offsetBy(dx: 20, dy: 20)
        //qView.layer.cornerRadius = 16
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }

}
