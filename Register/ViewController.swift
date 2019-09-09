//
//  ViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let loginToken = UserDefaults.standard.string(forKey: "loginToken");
        
        if (loginToken == nil) {
            self.performSegue(withIdentifier: "loginView", sender: self)
        } else {
            
            let _headers : HTTPHeaders = ["Authorization": "Bearer " + loginToken!]
            
            AF.request(URL(string: "http://127.0.0.1:8000/api/auth")!, method: .get, headers: _headers).responseJSON { response in
                
                // check for errors
                guard response.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling")
                    print(response.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.value as? NSDictionary else {
                    print("didn't get object as JSON from API")
                    return
                }
                
                let myData = try? NSKeyedArchiver.archivedData(withRootObject: json, requiringSecureCoding: false)
                
                
                UserDefaults.standard.set(myData, forKey: "user")
                UserDefaults.standard.synchronize()
                
                let decoded  = UserDefaults.standard.object(forKey: "user") as! Data
                let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! NSDictionary
                let displayEmail : String? = user["email"] as? String
                self.displayTextView.text = "Welcome, " + displayEmail!

                
            }
        }
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "loginToken");
        UserDefaults.standard.removeObject(forKey: "user");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    
    @IBAction func testLoginTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

