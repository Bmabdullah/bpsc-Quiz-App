//
//  SecondViewController.swift
//  QuranApp
//
//  Created by AL Mustakim on 5/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
 
    @IBOutlet weak var dateEngLabel: UILabel!
    @IBOutlet weak var dateHijriLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sahriLabel: UILabel!
    @IBOutlet weak var ifterLabel: UILabel!
    
    let prayerName = [" Fazr "," Duhr "," Asr "," Maghrib "," Esha "," Midnight "]
    
    @IBOutlet weak var prayerTableView: UITableView!
    
    var geting = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(geting)
        setupperLabelValue()
    }
    
    
    @IBAction func donatetoApp(_ sender: Any) {
    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LatLon.shared.PrayerTime.count
        
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = prayerTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PrayerTableViewCell
        cell.prayerName.text = prayerName[indexPath.row]
        cell.prayerTime.text = LatLon.shared.PrayerTime[indexPath.row]
        
        return cell
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
     


}
extension SecondViewController{
    func setupperLabelValue(){
        self.dateEngLabel .text = LatLon.shared.date
        self.dateHijriLabel.text = "\(LatLon.shared.dateHijri) Hizri"
        self.sunriseLabel.text = LatLon.shared.sunrise
        self.sunsetLabel.text = LatLon.shared.sunset
        self.sahriLabel.text = LatLon.shared.sahri
        self.ifterLabel.text = LatLon.shared.ifter
    }
}

