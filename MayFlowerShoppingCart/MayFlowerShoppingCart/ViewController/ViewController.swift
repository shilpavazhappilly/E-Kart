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
        let parameters = ["username":userNameTextField.text!,"password":passwordTextField.text!] as Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "13.229.125.8:8081/api/login")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    if let status = json["status"] as? String
                    {
                        if(status == "success")
                        {
                            self.performSegue(withIdentifier: "ProductListViewController", sender: self)
                            
                            print("yes")
                        }else{
                                                     self.showAlertView(message: "username&password are required", viewController: self)                            }
                    }
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    func showAlertView(message: String, viewController : UIViewController )
    {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }

    

    @IBAction func registerTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController")
        self.present(vc!, animated: true, completion: nil)
            }
}

