//
//  RegisterViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 04/09/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var createEmailTF: UITextField!
    @IBOutlet weak var createPasswordTF: UITextField!
    @IBOutlet weak var createNameTF: UITextField!
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        createEmailTF.delegate = self
        createPasswordTF.delegate = self
    }
    
    func alert(title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        let email = createEmailTF.text ?? ""
        let password = createPasswordTF.text ?? ""
        auth?.createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                self.alert(title: "Erro", message: "Erro no cadastro")
            }else {
                self.createEmailTF.text = " "
                self.createPasswordTF.text = " "
                self.performSegue(withIdentifier: "segueRegister", sender: nil)
            }
        })
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty == true {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.createEmailTF {
            self.createPasswordTF.becomeFirstResponder()
        }else if textField == self.createPasswordTF {
            createNameTF.becomeFirstResponder()
        } else {
            self.createNameTF.resignFirstResponder()
        }
        return true
    }
}
