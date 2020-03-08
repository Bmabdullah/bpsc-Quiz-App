//
//  ThirdViewController.swift
//  BPSCQuizApp
//  Created by AL Mustakim on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    var score: Int = Int()
    
    @IBOutlet weak var submitView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var centerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        submitView.isHidden = true
        centerView.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        submitView.isHidden = false
        animationResult()
        
    }
    
    
    
    @objc private func animationResult() {
        let center = view.center
        
        // create my track layer
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -CGFloat.pi , endAngle:  CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        
        
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0.9
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    
    
}
extension ThirdViewController : UITableViewDataSource,UITableViewDelegate, SelectedOptionDelegate{
    func selectedOption(option: IndexPath) {
        print(score)
    }

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailsQuizTableViewCell
        
        if selectedStates.rows.contains(indexPath.row) {
            
            if selectedStates.buttonTags[indexPath.row] == 0 {
                cell.isUserInteractionEnabled = false
                
            }
            if selectedStates.buttonTags[indexPath.row] == 1 {
                
                cell.isUserInteractionEnabled = false
                
            }
            if selectedStates.buttonTags[indexPath.row] == 2 {

                cell.isUserInteractionEnabled = false
                
            }
                
            else {
                
                cell.isUserInteractionEnabled = false
                
            }
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    
    
    
    
}
