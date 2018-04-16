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
        postLoginCall(url: "13.229.125.8:8081/api/login")
        
    }

    @IBAction func registerTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController")
        self.present(vc!, animated: true, completion: nil)
            }
}

// Mark:- Login
extension ViewController{
    func postLoginCall(url : String){
        
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        let postString = "emailaddress=\(userNameTextField.text!)&password=\(passwordTextField.text!)"
        print(postString)
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: data!) as? [String:AnyObject]{
                    print(responseJSON)
                    print(responseJSON["status"]!)
                    
                    
                   let response1 = responseJSON["status"]! as! Int
                    
                    print(response1)
                    
                    //Check response from the sever
                    if response1 == 200
                    {
                        OperationQueue.main.addOperation {
                            
                            //API call Successful and can perform other operatios
                            print("Login Successful")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListViewController")
                            self.present(vc!, animated: true, completion: nil)
                        }
                        
                    }
                        
                    else
                    {
                        OperationQueue.main.addOperation {
                            
                            //API call failed and perform other operations
                            print("Login Failed")
                            let alert  = UIAlertController(title: "Login Failed", message:"Invalid Credentials", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
                            alert.addAction(cancelAction)
                            self.present(alert, animated: true, completion: nil)

                            
                        }
                        
                    }
                    
                    
                }
            }
            catch {
                print("Error -> \(error)")
            }
            
            
            
        }
        
        
        task.resume()
        
        
        
    }
}


