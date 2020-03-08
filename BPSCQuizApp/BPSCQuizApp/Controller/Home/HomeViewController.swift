//
//  FirstViewController.swift
//  BPSCQuizApp
//
//  Created by AL Mustakim on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var questionArchivetableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  questionArchivetableView.delegate = self
        //  questionArchivetableView.dataSource = self

        guard let tabBar = self.tabBarController?.tabBar else { return }
        tabBar.tintColor = UIColor.systemIndigo
        tabBar.barTintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func numberOfSections (in questionArchivetableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: questionArchiveTableViewCell = self.questionArchivetableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! questionArchiveTableViewCell
        
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.questionView.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PDFViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
}

