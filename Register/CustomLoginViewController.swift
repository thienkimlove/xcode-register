//
//  CustomLoginViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit
import Alamofire

class CustomLoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text!;
        let userPassword = userPasswordTextField.text!;
        
        
        //let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        //let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
//        if ((userEmail ?? "") != userEmailStored || (userPassword ?? "") != userPasswordStored) {
//
//            displayAlert(msg:"Invalid Login!");
//
//            return;
//
//        }
        
        
        if let loginToken = UserDefaults.standard.string(forKey: "loginToken") {
            self.loginWithToken(storedToken: loginToken, userEmail: userEmail, userPassword: userPassword)
        } else {
            self.performLogin(email: userEmail, password: userPassword)
        }
        
    
    }
    
    func loginWithToken(storedToken : String, userEmail: String, userPassword : String) {
        
        print("Login with Token")
        
        let _headers : HTTPHeaders = ["Authorization": "Bearer " + storedToken]
        
        AF.request(URL(string: "http://127.0.0.1:8000/api/auth")!, method: .get, headers: _headers).responseJSON { response in
            
            // check for errors
            guard response.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling")
                print(response.error!)
                self.performLogin(email: userEmail, password: userPassword)
                return
            }
            
            // make sure we got some JSON since that's what we expect
            guard let json = response.value as? NSDictionary else {
                print("didn't get object as JSON from API")
                self.performLogin(email: userEmail, password: userPassword)
                return
            }
            
            // get and print the title
            guard let userId = json["id"] as? Int else {
                print("Could not get id from JSON")
                self.performLogin(email: userEmail, password: userPassword)
                return
            }
            
            print(userId)
            
            self.login()
            
        }
    }
    
    
    func login() {
        self.performSegue(withIdentifier: "homeView", sender: self)
    }
    
    func performLogin(email:String, password: String) {
        
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"];
        let  params : Parameters = ["email": email,"password": password];
        
        
        AF.request(URL(string: "http://127.0.0.1:8000/api/login")!, method: .post, parameters: params, headers: _headers).responseJSON { response in
            
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
            guard let loginToken = json["token"] as? String else {
                print("Could not get token from JSON")
                self.displayError();
                return
            }
            
            UserDefaults.standard.setValue(loginToken, forKey: "loginToken")
            UserDefaults.standard.synchronize()
            
            self.displaySuccess()
            
        }
        
    }
    
    func displaySuccess() {
        // Display confirm message and dismiss RegisterView.
        
        let confirmAlert = UIAlertController(title: "Confim", message: "Login Success! Thank you!", preferredStyle: UIAlertController.Style.alert);
        
        let actionConfirm  = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            
            self.performSegue(withIdentifier: "homeView", sender: self);
            
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
