//
//  ThirdViewController.swift
//  BPSCQuizApp
//  Created by AL Mustakim on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    var score: Int = Int()
    var result: Double = Double()
    
    var quizId: Int? = nil
    var numberOfQuizzes: Int? = nil
    var quizQuestionBankId: Int? = nil
    
    var questionBanks = [QuizQuestionBanks]()
    var confirmed = Confirmed()
    
    
    
    @IBOutlet weak var submitView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var totalMarkLabel: UILabel!
    @IBOutlet weak var markObtainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        submitView.isHidden = true
        centerView.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        score = 90
        
        
        if (quizId != 0 && quizId != nil) {
            getQuizDetailsByQuizId(quizId: self.quizId!)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        selectedStates.selectedRowsForButton1.removeAll()
        selectedStates.selectedRowsForButton2.removeAll()
        selectedStates.selectedRowsForButton3.removeAll()
        selectedStates.selectedRowsForButton4.removeAll()

    }
    
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        submitView.isHidden = false
        totalMarkLabel.text = "Total Mark : 100"
        markObtainLabel.text = "You Got : 85"
        result = Double(score/100)
        print(result)
        percentageLabel.text = "\(result * 100) %"
        animationResult()
        
        submitResult()
    }
    
    @IBAction func okButton(_ sender: Any) {
        tableView.reloadData()
        submitView.isHidden = true
        shapeLayer.isHidden = true
        trackLayer.isHidden = true
    }
    
    
    
    
    @objc private func animationResult() {
        
        
        let center = view.center
        
        // create my track layer
        
        
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
        
        basicAnimation.toValue = score
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    
    
}
extension ThirdViewController : UITableViewDataSource,UITableViewDelegate, SelectedOptionDelegate {
    
    
    func selectedOption(option: String) {
        
        confirmed.confirmedQuizId.append(self.quizId!)
        confirmed.confirmedQuizQuestionBankId.append(self.quizQuestionBankId!)
        confirmed.confirmedAnswer.append(option)
    }
    
    
    
//    func selectedOption(option: String) {
//        for _ in 0...numberOfQuizzes {
//
//            //            if data[i].correctanswer == option {
//            score += 1
//            print( "Score: \(score)")
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return numberOfQuizzes ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: detailsQuizTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailsQuizTableViewCell
        
        self.quizQuestionBankId = questionBanks[indexPath.row].quizQuestionBankId
        
        DispatchQueue.main.async {
            
            cell.qsnLabel.text = self.questionBanks[indexPath.row].question
            
            cell.op1.setTitle(self.questionBanks[indexPath.row].option1, for: .normal)
            
            cell.op2.setTitle(self.questionBanks[indexPath.row].option2, for: .normal)
            
            cell.op3.setTitle(self.questionBanks[indexPath.row].option3, for: .normal)
            
            cell.op4.setTitle(self.questionBanks[indexPath.row].option4, for: .normal)
        
        
        if selectedStates.selectedRowsForButton1.contains(indexPath.row) {
            
            
            cell.op1.setTitleColor(.red, for: .normal)
            cell.userInteraction(isEnabled: false)
            
            //   cell.correctAnswerLabel.isHidden = false
        }
        if selectedStates.selectedRowsForButton2.contains(indexPath.row) {
            
            
            cell.op2.setTitleColor(.red, for: .normal)
            cell.userInteraction(isEnabled: false)
            
            //   cell.correctAnswerLabel.isHidden = false
        }
        
        if selectedStates.selectedRowsForButton3.contains(indexPath.row) {
            
            cell.op3.setTitleColor(.red, for: .normal)
            cell.userInteraction(isEnabled: false)
            
            //   cell.correctAnswerLabel.isHidden = false
        }
        
        if selectedStates.selectedRowsForButton4.contains(indexPath.row) {
            
            cell.op4.setTitleColor(.red, for: .normal)
            cell.userInteraction(isEnabled: false)
            
            //   cell.correctAnswerLabel.isHidden = false
        }
    }
        
        cell.delegate = self
        
        return cell
    }
    
    
    func getQuizDetailsByQuizId(quizId: Int) {
        
        let apiUrl = UrlManager.baseURL() + "Quiz/GetQuizDetailsByQuizId/\(quizId)"
        
        fetchDatawithNSDictionary(apitype: "GET", urlString: apiUrl, baseURL: "") { (jsonDict) in
            
            do {
                
                let quizDetailsResponse = try JSONDecoder().decode(Base.self, from: jsonDict)
                
                self.numberOfQuizzes = (quizDetailsResponse.payload?.thisQuiz?.questionCount ?? nil)!
                self.questionBanks = (quizDetailsResponse.payload?.quizDetails?.quizQuestionBanks)!
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func submitResult() {
        
        let count: Int = confirmed.confirmedAnswer.count
        
        var quiz: Quiz?
        
        for answer in 0...count - 1 {
            
            quiz = Quiz(quizId: quizId!, quizQuestionBanks: [QuizQuestionBank(quizQuestionBankId: quizQuestionBankId!, question: "string", option1: "string", option2: "string", option3: "string", option4: "string", answer: confirmed.confirmedAnswer[answer], explanation: "string")])
            
            guard let uploadData = try? JSONEncoder().encode(quiz) else {
                return
            }
            
            
            
            let postUrl = UrlManager.baseURL() + "Quiz/AnswerQuiz"
            let url = URL(string: postUrl)! //PUT Your URL
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(String(describing: token))", forHTTPHeaderField: "Authorization")
            
            
            
            URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
                if let error = error {
                    print ("error: \(error)")
                    return
                }
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) else {
                    print ("server error")

                    return
                }
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                }
            }.resume()
        }
    }
}
