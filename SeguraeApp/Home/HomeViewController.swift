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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        enterValuesManagerView.tag = 1
        exitValuesManager.tag = 2
        
        enterValuesManagerView.delegate = self
        exitValuesManager.delegate = self
    }
    

    @IBAction func configAction(_ sender: UIButton) {
    }
    
}

extension HomeViewController: ValuesManagerViewDelegate {
    func didTapButton(view: ValuesManagerView) {
        let storyboard = UIStoryboard(name: "FinancialManager", bundle: nil)
        
        if view.tag == 1 {
            let viewController = storyboard.instantiateViewController(withIdentifier: "EnterFinancialValueIdentifier")
            navigationController?.pushViewController(viewController, animated: true)
        } else if view.tag == 2 {
            let viewController = storyboard.instantiateViewController(withIdentifier: "ExitFinancialValueIdentifier")
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
