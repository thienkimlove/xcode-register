//
//  CustomLoginViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit

class CustomLoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        
        let userPassword = userPasswordTextField.text;
        
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if ((userEmail ?? "") != userEmailStored || (userPassword ?? "") != userPasswordStored) {
            
            displayAlert(msg:"Invalid Login!");
            
            return;
            
        }
        
        UserDefaults.standard.set(true, forKey: "isLogin");
        UserDefaults.standard.synchronize();
        
        // Display confirm message and dismiss loginView.
        
        let confirmAlert = UIAlertController(title: "Confim", message: "Login Success! Thank you!", preferredStyle: UIAlertController.Style.alert);
        
        let actionConfirm  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            
            self.dismiss(animated: true, completion: nil);
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
