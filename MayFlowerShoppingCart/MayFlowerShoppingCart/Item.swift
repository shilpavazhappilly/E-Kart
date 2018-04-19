//
//  Item.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/19/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import Foundation
import UIKit
class Item {
    var productname :String = " "
    var productprice :Int = 0
    var productdescription :String = ""
    var productid : String = " "
    var productImage: UIImage? = nil
    
    init( name:String,price:Int, productdesp : String,productid : String , productImage :UIImage){
        
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
                            self.productid = (json["product_id"] as? String)!
                            self.productname = json["product_name"] as! String
                            self.productImage = json["product_image"] as? UIImage
                            self.productdescription = (json["product_description"] as? String)!
                            self.productprice = (json["price"] as? Int)!
                                
                                
                                
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
