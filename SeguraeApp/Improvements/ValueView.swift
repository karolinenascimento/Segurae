//
//  ValueView.swift
//  SeguraeApp
//
//  Created by Karoline Do Nascimento on 12/08/22.
//

//import UIKit
//
//class ValueView: UIView {
//
//    
//    @IBOutlet weak var illustrationImageView: UIImageView!
//    
//    @IBOutlet weak var descriptionLabel: UILabel!
//    
//    
//    @IBOutlet weak var valueTextField: UITextField!
//    
//    
//    @IBOutlet weak var confirmButton: UIButton!
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        let bundle = Bundle(for: ValueView.self)
//        guard let nibView = UINib(nibName: "ValueView", bundle: bundle).instantiate(withOwner: self).first as? UIView else {
//            return nil
//        }
//        
//        nibView.frame = bounds
//        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(nibView)
//    }
//  
//    @IBAction func confirmAction(_ sender: UIButton) {
//    }
//    
//}
