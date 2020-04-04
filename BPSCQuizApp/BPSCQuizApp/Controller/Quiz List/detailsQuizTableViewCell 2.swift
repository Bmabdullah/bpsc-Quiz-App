//
//  detailsQuizTableViewCell.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 1/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

protocol SelectedOptionDelegate {
    
    func selectedOption(option: String)
}

var selectedStates = SelectedStates()


class detailsQuizTableViewCell: UITableViewCell {
    
    @IBOutlet weak var qsnLabel: UILabel!
    
    @IBOutlet weak var op1: UIButton!
    
    @IBOutlet weak var op2: UIButton!
    
    @IBOutlet weak var op3: UIButton!
    
    @IBOutlet weak var op4: UIButton!
    
    var delegate: SelectedOptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userInteraction(isEnabled: true)
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userInteraction(isEnabled: true)
        
        op1.setTitleColor(.black, for: .normal)
        op2.setTitleColor(.black, for: .normal)
        op3.setTitleColor(.black, for: .normal)
        op4.setTitleColor(.black, for: .normal)
        
    }
    
    @IBAction func button1Action(_ sender: UIButton) {
        
        op1.setTitleColor(.red, for: .normal)
        
        userInteraction(isEnabled: false)
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        delegate?.selectedOption(option: String(op1.titleLabel?.text ?? ""))
        
        selectedStates.selectedRowsForButton1.append(indexPath.row)
        
    }
    
    @IBAction func button2Action(_ sender: Any) {
        
        userInteraction(isEnabled: false)
        op2.setTitleColor(.red, for: .normal)
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        delegate?.selectedOption(option: String(op2.titleLabel?.text ?? ""))
        
        selectedStates.selectedRowsForButton2.append(indexPath.row)
    }
    
    @IBAction func button3Action(_ sender: Any) {
        
        userInteraction(isEnabled: false)
        op3.setTitleColor(.red, for: .normal)
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        delegate?.selectedOption(option: String(op3.titleLabel?.text ?? ""))
        
        selectedStates.selectedRowsForButton3.append(indexPath.row)
    }
    
    @IBAction func button4Action(_ sender: Any) {
        
        userInteraction(isEnabled: false)
        op4.setTitleColor(.red, for: .normal)
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        
        delegate?.selectedOption(option: String(op4.titleLabel?.text ?? ""))
        
        selectedStates.selectedRowsForButton2.append(indexPath.row)
    }
    
     func userInteraction(isEnabled: Bool) {
        
        op1.isUserInteractionEnabled = isEnabled
        op2.isUserInteractionEnabled = isEnabled
        op3.isUserInteractionEnabled = isEnabled
        op4.isUserInteractionEnabled = isEnabled
    }
}
