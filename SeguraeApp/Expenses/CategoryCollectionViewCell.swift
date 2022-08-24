//
//  CategoryCollectionViewCell.swift
//  SeguraeApp
//
//  Created by Vinicius on 23/08/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier: String = "CategoryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setupCell(with category: CategoryModel) {
        categoryImageView.image = category.categoryIcon
        categoryLabel.text = category.categoryName
    }
    
}

