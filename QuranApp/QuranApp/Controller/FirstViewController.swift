//
//  FirstViewController.swift
//  QuranApp
//
//  Created by AL Mustakim on 5/4/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    var userIP = String()
    var lat = String()
    var lon = String()
  
    @IBOutlet weak var dateEng: UILabel!
    @IBOutlet weak var dateHij: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sahriLabel: UILabel!
    @IBOutlet weak var ifterLabel: UILabel!
    
    
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var suraTableView: UITableView!
    
    var suralist = [SuraListData]()
    let imageArr = [#imageLiteral(resourceName: "kaaba"),#imageLiteral(resourceName: "masjid-an-nabawi-")]
    var suraID = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gettingUserIPAddress()
        
        
        getData()
     //   setLabelValue()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func gettingUserIPAddress() {
        
        let url = URL(string: "https://api6.ipify.org")
        
        do {
            if let url = url {
                self.userIP = try String(contentsOf: url)
                
                guard let url = URL(string: "https://www.islamicfinder.us/index.php/api/prayer_times?user_ip=\(userIP )") else { return }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    if let data = data {
                        
                        do {
                            
                            let responseModel = try JSONDecoder().decode(BaseModel.self, from: data)
                            
                           
                            self.lon = responseModel.settings?.longitude ?? ""
                            self.lat = responseModel.settings?.latitude ?? ""
                            
                            LatLon.shared.lat = self.lat
                            LatLon.shared.lon = self.lon
                            
                            self.getPrayerTimeData(lat: self.lat, lon: self.lon)
                            
                            DispatchQueue.main.async {
                                
                               
                            }
                        }
                            
                        catch {
                            print(error.localizedDescription)
                            return
                        }
                    }
                }.resume()
               
            }
        }
        catch
            let error {
                print(error)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suralist.count
      }
      
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = suraTableView.dequeueReusableCell(withIdentifier: "SuraTableViewCell", for: indexPath) as! SuraTableViewCell
        
        
        
        if let surano = suralist[indexPath.row].number {

            suraID = String(surano)
        }
        
        
        
        cell.suraNo.text = String(suraID)
        cell.suraName.text = suralist[indexPath.row].englishName
        cell.suraMean.text = suralist[indexPath.row].englishNameTranslation
        cell.suraNameArabic.text = suralist[indexPath.row].name
        
        if suralist[indexPath.row].revelationType == "Meccan"{
            cell.suraImage.image = imageArr[0]
        }
        else{
            cell.suraImage.image = imageArr[1]
        }
        
        
        cell.layer.borderWidth = 0
        
        return cell
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "QuranViewController") as! QuranViewController
        navigationController?.pushViewController(vc, animated: true)
        
        if let surano = suralist[indexPath.row].number {

            suraID = String(surano)
        }
        
        vc.suraID = String(suraID)
        vc.suraName = suralist[indexPath.row].englishName ?? ""
        vc.suraNameArabic = suralist[indexPath.row].name ?? ""
    }

}

extension FirstViewController{
    func getData(){

                   guard let url = URL(string: "http://api.alquran.cloud/v1/surah") else { return }
                   var request = URLRequest(url: url)
                   request.httpMethod = "GET"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                  // request.httpBody = ""
                   
            
                   let task = URLSession.shared.dataTask(with: request) { data, response, error in
                       
                       if let data = data {
                                       do {
                                           let responseModel = try JSONDecoder().decode(SuraListBase.self, from: data)
                                        
                                   //     print("responce Model for user : " , responseModel)
                                        
                                    
                                           DispatchQueue.main.async {
                                            
                                            self.suralist.append(contentsOf: responseModel.data!)
                                        
                                           // print(self.suralist.count)
                                            self.suraTableView.reloadData()
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

    func getPrayerTimeData(lat : String , lon : String){
        
        //latlong using core location
        
//        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
//        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
//        print(loc)
//
        
       //using phone location
        

       guard let url = URL(string: "http://api.aladhan.com/v1/timings?latitude=\(lat)&longitude=\(lon)") else { return }
        
        
        print(url)
        
//using defualt location
        
  //      guard let url = URL(string: "http://api.aladhan.com/v1/timings?latitude=90.4093&longitude=90.23.7272") else { return }
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          // request.httpBody = ""
    
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               
               if let data = data {
                               do {
                                   let responseModel = try JSONDecoder().decode(PrayerTimeBase.self, from: data)
                                
                                print("responce Model for user : " , responseModel.data?.timings)
                                
                            
                                   DispatchQueue.main.async {
                                    
                                    let date = responseModel.data?.date?.readable ?? ""
                                    let dateHijri = responseModel.data?.date?.hijri?.date ?? ""
                                    let sunrise = responseModel.data?.timings?.sunrise ?? ""
                                    let sunset = responseModel.data?.timings?.sunset ?? ""
                                    let sahri = responseModel.data?.timings?.imsak ?? ""
                                    let ifter = responseModel.data?.timings?.sunset ?? ""
                                    
                                    let city = responseModel.data?.meta?.timezone ?? ""
                                    
                                    self.dateEng.text = date
                                    self.dateHij.text = "\(dateHijri) Hizri"
                                    self.sunriseLabel.text = sunrise
                                    self.sunsetLabel.text = sunset
                                    self.sahriLabel.text = sahri
                                    self.ifterLabel.text = ifter
                                    
                                    
                                    
                                    LatLon.shared.date = date
                                    LatLon.shared.dateHijri = dateHijri
                                    LatLon.shared.sunrise = sunrise
                                    LatLon.shared.sunset = sunset
                                    LatLon.shared.sahri = sahri
                                    LatLon.shared.ifter = ifter
                                    LatLon.shared.city = city
                                    
                                    
                                    let fajr = responseModel.data?.timings?.fajr
                                    let dhuhr = responseModel.data?.timings?.dhuhr
                                    let asr = responseModel.data?.timings?.asr
                                    let maghrib = responseModel.data?.timings?.maghrib
                                    let isha = responseModel.data?.timings?.isha
                                    let midnight = responseModel.data?.timings?.midnight
                                    
                                    print("the date is ", date)
                                    
                                    LatLon.shared.PrayerTime = [(fajr ?? ""),(dhuhr ?? ""),(asr ?? ""),(maghrib ?? ""),(isha ?? ""),(midnight ?? "")]
                                   
                                    print(LatLon.shared.PrayerTime)
                                    
                                    
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


