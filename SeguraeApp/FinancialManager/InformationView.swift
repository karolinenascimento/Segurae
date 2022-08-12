//
//  InformationView.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

import UIKit

class InformationView: UIView {

    @IBOutlet weak var messageLabel: UILabel!
   
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let bundle = Bundle(for: InformationView.self)
        guard let nibView = UINib(nibName: "InformationView", bundle: bundle).instantiate(withOwner: self).first as? UIView else {
            return nil
        }
        
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nibView)
    }
}
