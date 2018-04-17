//
//  ProductListViewController.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/16/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productlListTableView: UITableView!
    var productArray : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray
        self.productlListTableView.dataSource = self
        getProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cartButtonTapped(_ sender: Any) {
    }
    }
// Mark:- TableView Datasource
extension ProductListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let jsonObject = self.productArray[indexPath.row]
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ProductTableViewCell;
        cell.productIdLabel.text = self.productArray.value(forKey: "product_id") as? String
        cell.productNameLabel.text = self.productArray.value(forKey: "product_name") as? String
        cell.productImageView.image = self.productArray.value(forKey: "product_image") as? UIImage
        cell.productDescLabel.text = self.productArray.value(forKey: "product_description") as? String
        
        return cell
        

    }
}
// Mark:- Helper Methods
extension ProductListViewController {
    func getProducts(){
        let url = URL(string: "http://13.229.125.8:8081/api/search/product/:search_text")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
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
                            let product_id = json["product_id"] as? String
                            let product_name = json["product_name"] as? String
                            let product_image = json["product_image"] as? UIImage
                            let product_description = json["product_description"] as? String
                            self.productArray.add(product_id as Any)
                            self.productArray.add(product_name as Any)
                            self.productArray.add(product_image as Any)
                            self.productArray.add(product_description as Any)

                            
                            
                        }
                        
                        
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
    
//    func parseData(with data: Data?) {
//        guard let responseData = data else { return }
//        do {
//            if let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [[String: AnyObject]] {
//                print(jsonData)
//                
//                        //let product_id = jsonData["product_id"] as? String
//                        //let product_name = jsonData["product_name"] as? String
//                        let product_image = jsonData["product_image"] as? UIImage
//                        let product_description = jsonData["product_description"] as? String
//                    
//                    
//                        
//                
//            }
//        } catch let error {
//            print("Error Parsing data: \(error.localizedDescription)")
//        }
//    }



   
