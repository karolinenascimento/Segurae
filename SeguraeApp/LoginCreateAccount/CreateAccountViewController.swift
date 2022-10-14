//
//  CreateAccountViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var mainLoginImageView: UIImageView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var doLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIcomponents()
        // Do any additional setup after loading the view.
    }
    
    private func configureUIcomponents() {
        
        mainLoginImageView.layer.borderWidth = 2.0
        mainLoginImageView.layer.cornerRadius = 10
        mainLoginImageView.layer.borderColor = UIColor.green.cgColor
    }
}
