//
//  EnterValueViewController.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

import UIKit
import CoreData



class ExitFinancialValueViewController: UIViewController {
    
    @IBOutlet weak var informationView: InformationView!
    @IBOutlet weak var tableView: UITableView!
    
    var fetchedResultController: NSFetchedResultsController<Despesa>!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadDespesa()
        calcularTotal()
        tableView.backgroundColor = .black
        title = "Gerenciar saídas"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "InputValueTableViewCell", bundle: nil), forCellReuseIdentifier: "InputValueTableViewCell")
        informationView.messageLabel.text = "Aqui você pode visualizar e apagar suas despesas."
    }
    
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
    }
}

extension ExitFinancialValueViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputValueTableViewCell", for: indexPath) as! InputValueTableViewCell
        guard let despesa = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.prepararDespesa(with: despesa)
        return cell
    }
}

extension ExitFinancialValueViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let despesa = fetchedResultController.fetchedObjects?[indexPath.row] else {return}
            context.delete(despesa)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ExitFinancialValueViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete: if let indexPath = indexPath {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
            break
        default:
            tableView.reloadData()
        }
    }
}


