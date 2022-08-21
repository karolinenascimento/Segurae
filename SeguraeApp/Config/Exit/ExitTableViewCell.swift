//
//  ExitTableViewCell.swift
//  SeguraeApp
//
//  Created by Daniel on 16/08/22.
//

import UIKit

class ExitTableViewCell: UITableViewCell {

    @IBOutlet weak var exitLabel: UILabel!
    
    static let identifier = "ExitTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
