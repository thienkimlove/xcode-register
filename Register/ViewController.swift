//
//  ViewController.swift
//  Register
//
//  Created by Manh Quan Do on 9/4/19.
//  Copyright © 2019 Manh Quan Do. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let loginToken = UserDefaults.standard.string(forKey: "loginToken");
        
        if (loginToken == nil) {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "loginToken");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    
    @IBAction func testLoginTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

