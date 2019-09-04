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
        
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin");
        
        if (!isLogin) {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "isLogin");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self)
        
    }
    
}

