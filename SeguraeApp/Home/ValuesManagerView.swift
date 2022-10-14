//
//  ValuesManagerView.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 10/08/22.
//

import UIKit

protocol ValuesManagerViewDelegate {
    func didTapButton( view: ValuesManagerView)
    
}

class ValuesManagerView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var managerButton: UIButton!
    
    var delegate: ValuesManagerViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let bundle = Bundle(for: ValuesManagerView.self)
        guard let nibView = UINib(nibName: "ValuesManagerView", bundle: bundle).instantiate(withOwner: self).first as? UIView else {
            return nil
        }
        
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nibView)
    }
    
    @IBAction func managerAction(_ sender: UIButton) {
        
        delegate?.didTapButton(view: self)

    }
}
