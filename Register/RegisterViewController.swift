//
//  RegisterViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        if ((userEmail ?? "").isEmpty || (userPassword ?? "").isEmpty || (userRepeatPassword ?? "").isEmpty) {
            displayAlert(msg:"All fields are required!");
            return;
        }
        
        if (userPassword != userRepeatPassword) {
            displayAlert(msg: "Password not match!");
            return;
        }
        
        //Stored Data
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.synchronize();
        
        // Display confirm message and dismiss RegisterView.
        
        let confirmAlert = UIAlertController(title: "Confim", message: "Registration Success! Thank you!", preferredStyle: UIAlertController.Style.alert);
        
        let actionConfirm  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            
            self.performSegue(withIdentifier: "backToLogin", sender: self);
        }
        
        confirmAlert.addAction(actionConfirm);
        
        self.present(confirmAlert, animated: true, completion: nil);
        
    }
    
    func displayAlert(msg:String) {
        let myAlert = UIAlertController(title: "Alert!", message: msg, preferredStyle: UIAlertController.Style.alert);
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okButton);
        
        self.present(myAlert, animated: true, completion: nil);
        
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
