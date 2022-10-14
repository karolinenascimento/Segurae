//
//  ExpenseTableViewCellXIB.swift
//  SeguraeApp
//
//  Created by Vinicius on 25/09/22.
//

//import UIKit
//
//class ExpenseTableViewCellXIB: UITableViewCell {
//
//    @IBOutlet weak var containerView: UIView!
//    
//    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var valueLabel: UILabel!
//  
//    static let identifier = "ExpenseTableViewCell"
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        containerView.layer.cornerRadius = 10.0
//        containerView.clipsToBounds = true
//    }
//    
//    static func nib() -> UINib{
//        return UINib(nibName: self.identifier, bundle: nil)
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    func prepare(with despesa:Despesa) {
//        valueLabel.text = despesa.despesa
//        descriptionLabel.text = despesa.descricao
//    }
//    
//}
