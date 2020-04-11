//
//  SuraTableViewCell.swift
//  QuranApp
//
//  Created by AL Mustakim on 5/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class SuraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var suraNo: UILabel!
    @IBOutlet weak var suraName: UILabel!
    @IBOutlet weak var suraMean: UILabel!
    @IBOutlet weak var suraImage: UIImageView!
    @IBOutlet weak var suraNameArabic: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0))
        contentView.layer.cornerRadius = 8
        
    }

}
