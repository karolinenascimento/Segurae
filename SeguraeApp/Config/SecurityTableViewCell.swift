//
//  SecurityTableViewCell.swift
//  SeguraeApp
//
//  Created by Daniel on 16/08/22.
//

import UIKit

class SecurityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var securityLabel: UILabel!
    
    static let identifier = "SecurityTableViewCell"
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
