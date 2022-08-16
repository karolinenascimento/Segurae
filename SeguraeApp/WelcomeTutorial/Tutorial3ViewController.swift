//
//  Tutorial3ViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class Tutorial3ViewController: UIViewController {
    @IBOutlet weak var tutorial3ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        // Do any additional setup after loading the view.
    }
    

    private func configureImageView() {
        tutorial3ImageView.layer.cornerRadius = 10
        tutorial3ImageView.layer.borderWidth = 2.0
        tutorial3ImageView.layer.borderColor = UIColor.green.cgColor
        
    }

}
