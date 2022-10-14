//
//  EnterValueViewController.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

//import UIKit
//
//class EnterFinancialValueViewController: UIViewController {
//
//    @IBOutlet weak var informationView: InformationView!
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Gerenciar entradas"
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "InputValueTableViewCell", bundle: nil), forCellReuseIdentifier: "InputValueTableViewCell")
//        
//        informationView.messageLabel.text = "Aqui você pode editar e ajustar o saldo de entrada de acordo com a sua necessidade."
//    }
//    
//
// 
//}
//
//extension EnterFinancialValueViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "InputValueTableViewCell", for: indexPath) as? InputValueTableViewCell {
//            cell.titleLabel.text = "Valor de entrada"
//            cell.valueLabel.text = "R$ 150,00"
//            return cell
//        }
//        
//        return UITableViewCell()
//    }
//}
//
//extension EnterFinancialValueViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "FinancialManager", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "EntryValueIdentifier")
//        navigationController?.pushViewController(viewController, animated: true)
//    }
//}
