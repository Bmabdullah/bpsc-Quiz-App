//
//  PDFViewController.swift
//  BPSCQuizApp
//
//  Created by Arika Afrin Boshra on 27/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.isNavigationBarHidden = false
        
        if let path = Bundle.main.path(forResource: "Swift", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url: url) {
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
            }
        }
    }
    
}
