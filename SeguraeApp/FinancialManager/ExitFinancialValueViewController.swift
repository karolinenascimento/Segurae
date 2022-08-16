//
//  EnterValueViewController.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

import UIKit

class ExitFinancialValueViewController: UIViewController {

    @IBOutlet weak var informationView: InformationView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InputValueTableViewCell", bundle: nil), forCellReuseIdentifier: "InputValueTableViewCell")
        
        informationView.messageLabel.text = "Aqui você pode editar e ajustar as saídas fixas de acordo com a sua necessidade."
    }
    

 
}

extension ExitFinancialValueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InputValueTableViewCell", for: indexPath) as? InputValueTableViewCell {
            cell.titleLabel.text = "Valor de saída"
            cell.valueLabel.text = "R$ 150,00"
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

extension ExitFinancialValueViewController: UITableViewDelegate {
    
}
