//
//  Tutorial4ViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class Tutorial4ViewController: UIViewController {
    @IBOutlet weak var tutorial4ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        // Do any additional setup after loading the view.
    }
    

    private func configureImageView() {
        tutorial4ImageView.layer.cornerRadius = 10
        tutorial4ImageView.layer.borderWidth = 2.0
        tutorial4ImageView.layer.borderColor = UIColor.green.cgColor
        
    }

}
