//
//  ProfileTableViewCell.swift
//  SeguraeApp
//
//  Created by Daniel on 16/08/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    static let cellIdentifier = "ProfileTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: cellIdentifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with general: GeneralModel) {
        typeLabel.text = general.type
        iconImageView.image = general.icon
        textField.text = general.data
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
