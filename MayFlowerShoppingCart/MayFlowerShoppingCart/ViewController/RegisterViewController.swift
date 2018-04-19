//
//  RegisterViewController.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/11/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import UIKit
var registerInfo = [ String: String]()


class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        print("Storing the information")
        let result = isValidEmail(testStr: emailTextField.text!)
        if result{
            print("Valid")
        }else{
            let alert  = UIAlertController(title: "Alert", message:"Invalid Email ID", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        /*let result1 = validate(value: phoneNumTextField.text!)
        if result1{
            print("Valid")
        }else{
            let alert  = UIAlertController(title: "Alert", message:"Invalid Phone Number", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }*/

        registerInfo["first_name"] = firstNameTextField.text!
        registerInfo["last_name"] = lastNameTextField.text!
        registerInfo["email"] = emailTextField.text!
        registerInfo["mobile"] = phoneNumTextField.text!
        registerInfo["password"] = passwordTextFIeld.text!
       
        register()

    }
    

    }
// Mark:- Posting data
extension RegisterViewController{
    func register (){
        if let jsonData = try? JSONSerialization.data(withJSONObject: registerInfo, options: []){
        // Creating URL
            
        let url = URL(string: "http://13.229.125.8:8081/api/register")!
            print("Url Created Sucessfully")
        //create the session object
       // let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        request.httpBody = jsonData
            //create the session object
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
                if error != nil{
                    print(error?.localizedDescription as Any)
                    return
                }else {
                if let response = response as? HTTPURLResponse {
                    print("Reaponse Code \(response.statusCode)")
                    if response.statusCode == 200 {
                        print("Server responded successfully, API calling Successful")
                        self.parseData(with: data)
                        OperationQueue.main.addOperation {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
                        self.present(vc!, animated: true, completion: nil)
                        }
                    }
                } else {
                    
                    print(error?.localizedDescription ?? "")
                    }
                    
                }

                
    
            }
            task.resume()

}
       
}
    func parseData(with data: Data?) {
        guard let responseData = data else { return }
        do  {
            if let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as?NSDictionary {
                print(jsonData)
                
            }
        }catch let error {
            print("Error Parsing data: \(error.localizedDescription)")
            
                    }
        
    }
}

// Mark:- Validation Phone Number and Email
extension RegisterViewController{
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    /*func validate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }*/
    
}
