//
//  Tutorial1ViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class Tutorial1ViewController: UIViewController {
    @IBOutlet weak var tutorial1ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        // Do any additional setup after loading the view.
    }
    
    private func configureImageView() {
        tutorial1ImageView.layer.cornerRadius = 10
        tutorial1ImageView.layer.borderWidth = 2.0
        tutorial1ImageView.layer.borderColor = UIColor.green.cgColor
        
    }
   

}
