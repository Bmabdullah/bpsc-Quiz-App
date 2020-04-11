//
//  QuranViewController.swift
//  QuranApp
//
//  Created by AL Mustakim on 7/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class QuranViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var suraDetailsTableView: UITableView!
    var suraName = String()
    var suraNameArabic = String()
    var suraID = String()
    @IBOutlet weak var suraNameLabel: UILabel!
    
    var ayathobj = [Ayahs]()

let arr = ["إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ","اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ","صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ"]
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        suraNameLabel.text = "\(suraName) - \(suraNameArabic)"
        getSuraData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ayathobj.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! quranTableViewCell
        cell.ayathLabel.text = ayathobj[indexPath.row].text
        return cell
    }
    


}
extension QuranViewController{
    func getSuraData(){

                   guard let url = URL(string: "http://api.alquran.cloud/v1/surah/\(suraID)") else { return }
                   var request = URLRequest(url: url)
        print(url)
                   request.httpMethod = "GET"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                  // request.httpBody = ""
                   
            
                   let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       
                       if let data = data {
                                       do {
                                        let responseModel = try JSONDecoder().decode(SuraBase.self, from: data)
                                        
                                        print("responce Model for user : " , responseModel)
                                        
                                    
                                           DispatchQueue.main.async {
                                            
                                            self.ayathobj.append(contentsOf: (responseModel.data?.ayahs)!)
                                        
                                            print(self.ayathobj)
                                            self.suraDetailsTableView.reloadData()
                                        }
                                        
                                       }
                                       catch {
                                           print(error.localizedDescription)
                                           return
                                       }
                                   }
                    
                   }
            task.resume()
                   
               }


}

