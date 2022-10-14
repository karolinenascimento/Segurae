//
//  Tutorial2ViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class Tutorial2ViewController: UIViewController {
    @IBOutlet weak var tutorial2ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        // Do any additional setup after loading the view.
    }
    
    private func configureImageView() {
        tutorial2ImageView.layer.cornerRadius = 10
        tutorial2ImageView.layer.borderWidth = 2.0
        tutorial2ImageView.layer.borderColor = UIColor.green.cgColor
        
    }

}
