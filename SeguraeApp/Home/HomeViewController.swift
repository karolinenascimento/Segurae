//
//  HomeViewController.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 10/08/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, NSFetchedResultsControllerDelegate {
    let service = ValueAPI()
    
    @IBOutlet weak var enterValuesManagerView: ValuesManagerView!
    @IBOutlet weak var exitValuesManager: ValuesManagerView!
    @IBOutlet weak var apiLabel: UILabel!
    @IBOutlet weak var imageContentView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    
    var fetchedResultController: NSFetchedResultsController<Despesa>!
    var entradaFetch: NSFetchedResultsController<Entrada>!
    var entrada: Entrada!
    var totalDespesa: Double = 0.00
    var totalReceita: Double = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageContentView.layer.cornerRadius = 46.5
        userImageView.layer.cornerRadius = 42.5
        userImageView.layer.borderWidth = 3.0
        userImageView.layer.borderColor = UIColor(red: 89/255, green: 232/255, blue: 137/255, alpha: 1.0).cgColor
        enterValuesManagerView.titleLabel.text = "Saldo"
        enterValuesManagerView.valueLabel.text = "R$ 0,00"
        enterValuesManagerView.managerButton.setTitle("Adicionar saldo", for: .normal)
        enterValuesManagerView.layer.cornerRadius = 10.0
        enterValuesManagerView.clipsToBounds = true
        exitValuesManager.titleLabel.text = "Controle de despesas"
        exitValuesManager.managerButton.setTitle("Gerenciar despesas", for: .normal)
        exitValuesManager.layer.cornerRadius = 10.0
        exitValuesManager.clipsToBounds = true
        enterValuesManagerView.tag = 1
        exitValuesManager.tag = 2
        enterValuesManagerView.delegate = self
        exitValuesManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        adicionarSaldo()
        loadAPI()
    }
    
    @IBAction func configAction(_ sender: UIButton) {
    }
    
    func showAlert() {
        
        let title = "Adicionar"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Valor de entrada"
        }
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            let value = alert.textFields?.first?.text
            self.entrada = Entrada(context: self.context)
            self.entrada.entrada = value
            do {
                try self.context.save()
                self.adicionarSaldo()
            }catch {
                print(error.localizedDescription)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.view.backgroundColor = .lightGray
        alert.view.tintColor = UIColor(red: 89/255, green: 232/255, blue: 137/255, alpha: 1.0)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: ValuesManagerViewDelegate {
    
    func didTapButton(view: ValuesManagerView) {
        
        let storyboard = UIStoryboard(name: "FinancialManager", bundle: nil)
        if view.tag == 1 {
            showAlert()
        } else if view.tag == 2 {
            let viewController = storyboard.instantiateViewController(withIdentifier: "ExitFinancialValueIdentifier")
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension HomeViewController {
    
    func loadDespesa() {
        
        let fetchRequest: NSFetchRequest<Despesa> = Despesa.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "despesa", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func calcularTotal() {
        
        let total = fetchedResultController.fetchedObjects?.reduce(0.0,{ x, y in
            let value = Double(y.despesa ?? "0")
            return x + (value ?? 0)
        } ) ?? 0.00
        exitValuesManager.valueLabel.text = String(format: "R$: %.2f", total)
        totalDespesa = total
    }
    
    func loadReceita() {
        
        let fetchRequest: NSFetchRequest<Entrada> = Entrada.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "entrada", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        entradaFetch = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        entradaFetch.delegate = self
        do {
            try entradaFetch.performFetch()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func calcularSaldo() {
        
        let total = entradaFetch.fetchedObjects?.reduce(0.0,{ x, y in
            let value = Double(y.entrada ?? "0")
            return x + (value ?? 0)
        } ) ?? 0.00
        totalReceita = total - totalDespesa
        enterValuesManagerView.valueLabel.text = String(format: "R$: %.2f", totalReceita)
    }
    
    func adicionarSaldo() {
        
        self.loadDespesa()
        self.calcularTotal()
        self.loadReceita()
        self.calcularSaldo()
    }
    
    func loadAPI() {
        
        ValueAPI.valueRequest(high: apiLabel.text!) { (valueConverter) in
            DispatchQueue.main.sync {
                self.apiLabel.text = "Dólar hoje: R$ \(valueConverter.usdbrl.high)"
            }
        }
    }
}


