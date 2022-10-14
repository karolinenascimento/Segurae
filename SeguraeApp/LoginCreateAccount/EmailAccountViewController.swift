//
//  EmailAccountViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 14/08/22.
//

import UIKit

class EmailAccountViewController: UIViewController {
    @IBOutlet weak var createAccountImageView: UIImageView!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountEmailTextField.text = "123231421"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
