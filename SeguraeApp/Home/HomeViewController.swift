//
//  HomeViewController.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 10/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var enterValuesManagerView: ValuesManagerView!
   
    @IBOutlet weak var exitValuesManager: ValuesManagerView!
    
    @IBOutlet weak var imageContentView: UIView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var notificationView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationView.layer.cornerRadius = 10.0
        imageContentView.layer.cornerRadius = 46.5
        userImageView.layer.cornerRadius = 42.5
        userImageView.layer.borderWidth = 3.0
        userImageView.layer.borderColor = UIColor(red: 89/255, green: 232/255, blue: 137/255, alpha: 1.0).cgColor
       
        enterValuesManagerView.titleLabel.text = "Valor de entrada"
        enterValuesManagerView.valueLabel.text = "R$ 243,00"
        enterValuesManagerView.managerButton.setTitle("Gerenciar entradas", for: .normal)
        enterValuesManagerView.layer.cornerRadius = 10.0
        enterValuesManagerView.clipsToBounds = true
        
        exitValuesManager.titleLabel.text = "Controle de saída"
        exitValuesManager.valueLabel.text = "R$ 223,00"
        exitValuesManager.managerButton.setTitle("Gerenciar saídas", for: .normal)
        exitValuesManager.layer.cornerRadius = 10.0
        exitValuesManager.clipsToBounds = true
    }
    

    @IBAction func configAction(_ sender: UIButton) {
    }
    
}
