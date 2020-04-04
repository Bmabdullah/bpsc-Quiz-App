//
//  BaseUrl.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 10/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class UrlManager: NSObject {
    
    private static let DEV_BASE_URL = "http://103.192.157.61:85/api/"

    class func baseURL()->String {
        return DEV_BASE_URL
    }
    
//    func findRepositories( pathwithOutq:String, matching query: String)-> URL {
//          let api = UrlManager.baseURL()
//          let endpoint = "\(pathwithOutq)?q=\(query)"
//          let url = (URL(string: api + endpoint) ?? URL(string: "https://www.google.com"))!
//          return url
//      }
     
}

