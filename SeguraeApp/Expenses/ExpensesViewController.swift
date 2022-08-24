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
        
        if let layout = self.categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 70
            layout.itemSize.width = 90
            layout.itemSize.height = 100
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
            CategoryModel(categoryIcon: UIImage(systemName: "bag.circle.fill") ?? UIImage(), categoryName: "Geral"),
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
        //        return CGSize(width: (self.view.frame.width / 2) - 10, height: collectionView.frame.height)
        return CGSize(width: 90, height: 100)
    }
    
    
    
}
