//
//  RoundFrameImageView.swift
//  QuizDesignOne
//
//  Created by Abid AB on 27/2/20.
//  Copyright © 2020 Abid AB. All rights reserved.
//

import UIKit

@IBDesignable
class RoundFrameImageView: UIImageView {

    @IBInspectable var roundImageView: Bool = false {
        
        didSet{
            
            if roundImageView{
                
                layer.cornerRadius = frame.height / 2
                
            }
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        if roundImageView{
            
            layer.cornerRadius = frame.height / 2
            
        }
    }


}
