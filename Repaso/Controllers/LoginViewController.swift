//
//  LoginViewController.swift
//  Repaso
//
//  Created by Erick Carrasco on 7/4/18.
//  Copyright © 2018 Erick Carrasco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMain", sender: self)
    }
    

}
