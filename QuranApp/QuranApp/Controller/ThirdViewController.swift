//
//  ThirdViewController.swift
//  QuranApp
//
//  Created by AL Mustakim on 5/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var donate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        donate.layer.cornerRadius = 8
        placeNameLabel.text = LatLon.shared.city
        
    }
    
    @IBAction func donateButton(_ sender: Any) {
        
        let phoneNumber =  "+8801780290571"
        
        let appURL = URL(string: "https://wa.me/\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
    

}
