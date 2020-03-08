//
//  detailsQuizTableViewCell.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 1/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

protocol SelectedOptionDelegate {
    
    func selectedOption(option: IndexPath)
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
        // Initialization code
        
        op1.isUserInteractionEnabled = true
        op2.isUserInteractionEnabled = true
        op3.isUserInteractionEnabled = true
        op4.isUserInteractionEnabled = true
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        op1.isUserInteractionEnabled = true
        op2.isUserInteractionEnabled = true
        op3.isUserInteractionEnabled = true
        op4.isUserInteractionEnabled = true
        
        
    }
    
    @IBAction func button1Action(_ sender: UIButton) {
        
        op1.isUserInteractionEnabled = false
        op2.isUserInteractionEnabled = false
        op3.isUserInteractionEnabled = false
        op4.isUserInteractionEnabled = false
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        delegate?.selectedOption(option: indexPath as IndexPath)
        
        selectedStates.rows.append(indexPath.row)
        selectedStates.buttonTags.append(sender.tag)
        
        print(selectedStates.rows)
        print(selectedStates.buttonTags)
        
    }
    
    @IBAction func button2Action(_ sender: Any) {
        op1.isUserInteractionEnabled = false
        op2.isUserInteractionEnabled = false
        op3.isUserInteractionEnabled = false
        op4.isUserInteractionEnabled = false
        
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        delegate?.selectedOption(option: indexPath as IndexPath)
        
        selectedStates.rows.append(indexPath.row)
        selectedStates.buttonTags.append((sender as AnyObject).tag)
        
        print(selectedStates.rows)
        print(selectedStates.buttonTags)
    }
    
    @IBAction func button3Action(_ sender: Any) {
        op1.isUserInteractionEnabled = false
        op2.isUserInteractionEnabled = false
        op3.isUserInteractionEnabled = false
        op4.isUserInteractionEnabled = false
        
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        delegate?.selectedOption(option: indexPath as IndexPath)
        
        selectedStates.rows.append(indexPath.row)
        selectedStates.buttonTags.append((sender as AnyObject).tag)
        
        print(selectedStates.rows)
        print(selectedStates.buttonTags)
    }
    
    @IBAction func button4Action(_ sender: Any) {
        op1.isUserInteractionEnabled = false
        op2.isUserInteractionEnabled = false
        op3.isUserInteractionEnabled = false
        op4.isUserInteractionEnabled = false
        
        
        let indexPath :NSIndexPath = (self.superview! as! UITableView).indexPath(for: self)! as NSIndexPath
        delegate?.selectedOption(option: indexPath as IndexPath)
        
        selectedStates.rows.append(indexPath.row)
        selectedStates.buttonTags.append((sender as AnyObject).tag)
        
        print(selectedStates.rows)
        print(selectedStates.buttonTags)
    }
    
    
}
