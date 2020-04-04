//
//  FirstViewController.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let baseURL = "http://103.192.157.61:85/api/"
    var objectpayload = [Payload]()
    @IBOutlet weak var questionArchivetableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDictionaryData()
        navigationController?.setNavigationBarHidden(true, animated: true)

        guard let tabBar = self.tabBarController?.tabBar else { return }
        tabBar.tintColor = UIColor.systemIndigo
        tabBar.barTintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.black
        
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
}

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectpayload.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: questionArchiveTableViewCell = self.questionArchivetableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! questionArchiveTableViewCell
        
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.questionView.layer.cornerRadius = 8
        cell.questionArchiveLabel.text = objectpayload[indexPath.row].examName ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PDFViewController") as! PDFViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.urlString = objectpayload[indexPath.row].fileURL ?? ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
}
extension HomeViewController{
     func getDictionaryData() {
           let apiUrl = "\(baseURL)PreviousQuestion/GetPreviousQuestionList"
           print(apiUrl)
           fetchDatawithNSDictionary(apitype: "GET", urlString: apiUrl, baseURL: "") { (jsonDict) in
            

            do {
                    
                    
                let responseModel = try JSONDecoder().decode(HomeBase.self, from: jsonDict)
               
                
             
                let temp:Int = responseModel.payload?.count ?? 0
                
                if(temp>0){
                    
                    for response in responseModel.payload!{
                        
                        self.objectpayload.append(response)
                       
                    }
                }
               if self.objectpayload.count != 0{
                self.questionArchivetableView.reloadData()
                
                 }
            }
                catch{
                    
                }
                
            }
       }
    
}
