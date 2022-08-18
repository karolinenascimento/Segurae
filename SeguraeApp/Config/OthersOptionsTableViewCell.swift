//
//  OthersOptionsTableViewCell.swift
//  SeguraeApp
//
//  Created by Daniel on 16/08/22.
//

import UIKit

class OthersOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var othersOptionsLabel: UILabel!
    @IBOutlet weak var othersOpitionsButton: UIButton!
    
    static let identifier = "OthersOptionsTableViewCell"
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
