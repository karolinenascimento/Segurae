//
//  ExpensesViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 23/08/22.
//
import UIKit
import CoreData

class ExpensesViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var textfieldValue: UITextField!
    
    var categoryItens: [CategoryModel] = []
    var despesa: Despesa!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setCategoryData()
    }
    
    @IBAction func addExpense(_ sender: UIButton) {
        
        despesa = Despesa(context: context)
        despesa.despesa = textfieldValue.text
        despesa.descricao = textFieldDescription.text
        
        do {
            try context.save()
            self.alert(title: "OK", message: "Despesa adicionada com sucesso")
            textfieldValue.text = ""
            textFieldDescription.text = ""
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func alert(title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func configureCollectionView() {
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        if let layout = self.categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize.width = 150
            layout.itemSize.height = 150
            layout.collectionView?.backgroundColor = .darkGray
            
        }
    }
    
    func setCategoryData() {
        
        categoryItens.append(contentsOf: [
            CategoryModel(categoryIcon: UIImage(systemName: "fork.knife.circle.fill") ?? UIImage(), categoryName: "Alimentação"),
            CategoryModel(categoryIcon: UIImage(systemName: "house.circle.fill") ?? UIImage(), categoryName: "Casa"),
            CategoryModel(categoryIcon: UIImage(systemName: "sun.max.circle.fill") ?? UIImage(), categoryName: "Lazer"),
            CategoryModel(categoryIcon: UIImage(systemName: "cart.circle.fill") ?? UIImage(), categoryName: "Mercado"),
            CategoryModel(categoryIcon: UIImage(systemName: "car.circle.fill") ?? UIImage(), categoryName: "Transporte"),
            CategoryModel(categoryIcon: UIImage(systemName: "bag.circle.fill") ?? UIImage(), categoryName: "Geral")
        ])
        
    }
}

extension ExpensesViewController: UICollectionViewDelegate {
}

extension ExpensesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryItens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.setupCell(with: categoryItens[indexPath.item])
        return cell
    }
}

extension ExpensesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width / 2) - 10, height: collectionView.frame.height)
    }
}
