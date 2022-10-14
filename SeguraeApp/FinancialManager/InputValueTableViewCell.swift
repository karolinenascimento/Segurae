//
//  ImputValueTableViewCell.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

import UIKit

class InputValueTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepararDespesa(with despesa:Despesa) {
        
        valueLabel.text = despesa.despesa
        titleLabel.text = despesa.descricao
    }
}
