//
//  ExpensesViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 23/08/22.
//

import UIKit

class ExpensesViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categoryItens: [CategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setCategoryData()

       
    }
    
    private func configureCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
    }

    func setCategoryData() {
        categoryItens.append(contentsOf: [
                            CategoryModel(categoryIcon: "alimentacao", categoryName: "Alimentação"),
                            CategoryModel(categoryIcon: "casa", categoryName: "Casa"),
                            CategoryModel(categoryIcon: "lazer", categoryName: "Lazer"),
                            CategoryModel(categoryIcon: "mercado", categoryName: "Mercado"),
                            CategoryModel(categoryIcon: "transporte", categoryName: "Transporte"),
                            CategoryModel(categoryIcon: "compras", categoryName: "Compras em geral")
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
        return CGSize(width: (self.view.frame.width / 2) - 10, height: collectionView.frame.height)
    }
    
}
