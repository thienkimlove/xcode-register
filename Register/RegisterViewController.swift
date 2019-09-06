//
//  RegisterViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    @IBOutlet weak var userRepeatPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text!;
        let userPassword = userPasswordTextField.text!;
        let userRepeatPass = userRepeatPassTextField.text!;
        if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPass.isEmpty) {
            displayAlert(msg:"All fields are required!");
            return;
        }
        
        if (userPassword != userRepeatPass) {
            displayAlert(msg: "Password not match!");
            return;
        }
        
        //Stored Data
        
        //UserDefaults.standard.set(userEmail, forKey: "userEmail");
        //UserDefaults.standard.set(userPassword, forKey: "userPassword");
        //UserDefaults.standard.synchronize();
        
        
        // Call API laravel
        
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"];
        let  params : Parameters = ["email": userEmail,"password": userPassword];
        
        
        AF.request(URL(string: "http://127.0.0.1:8000/api/signup")!, method: .post, parameters: params, headers: _headers).responseJSON { response in
            
            // check for errors
            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling")
                print(response.error!)
                self.displayError();
                return
            }
            
            // make sure we got some JSON since that's what we expect
            guard let json = response.value as? NSDictionary else {
                print("didn't get object as JSON from API")
                self.displayError();
                return
            }
            
            print(json)
            
            
            // get and print the title
            guard let userId = json["id"] as? Int else {
                print("Could not get id from JSON")
                self.displayError();
                return
            }
            print(userId)
            
            self.displaySuccess()
            
        }
        
        
        
    }
    
    func displaySuccess() {
        // Display confirm message and dismiss RegisterView.
        
        let confirmAlert = UIAlertController(title: "Confim", message: "Registration Success! Thank you!", preferredStyle: UIAlertController.Style.alert);
        
        let actionConfirm  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            
            self.performSegue(withIdentifier: "backToLogin", sender: self);
            
        }
        
        confirmAlert.addAction(actionConfirm);
        
        self.present(confirmAlert, animated: true, completion: nil);
    }
    
    func displayError() {
        let confirmAlert = UIAlertController(title: "Confim", message: "Failed to Registration!", preferredStyle: UIAlertController.Style.alert);
        
        let actionConfirm  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            
            
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
