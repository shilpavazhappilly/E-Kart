//
//  ViewController.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/10/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func forgotPasswordTapped(_ sender: Any) {
    }

    
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController")
        self.present(vc!, animated: true, completion: nil)
            }
}

