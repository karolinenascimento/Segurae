//
//  LoginViewController.swift
//  SeguraeApp
//
//  Created by Vinicius on 04/09/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginEmailTF: UITextField!
    @IBOutlet weak var passwordTextfieldTF: UITextField!
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.auth = Auth.auth()
        loginEmailTF.delegate = self
        passwordTextfieldTF.delegate = self
    }
    
    func alert(title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func doLoginButton(_ sender: Any) {
        
        let email = loginEmailTF.text ?? ""
        let password = passwordTextfieldTF.text ?? ""
        auth?.signIn(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                self.loginEmailTF.text = ""
                self.passwordTextfieldTF.text = ""
                self.alert(title: "Oooopa", message: "Por favor, verifique seus dados")
            }else{
                if user == nil {
                    self.alert(title: "Opa!", message: "Erro inesperado")
                }else{
                    self.loginEmailTF.text = " "
                    self.passwordTextfieldTF.text = " "
                    self.performSegue(withIdentifier: "loginButton", sender: nil)
                }
            }
        })
    }
}
extension LoginViewController: UITextFieldDelegate {
    
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
        
        if textField == self.loginEmailTF {
            self.passwordTextfieldTF.becomeFirstResponder()
        
        } else {
            self.passwordTextfieldTF.resignFirstResponder()
        }
        return true
    }
}
