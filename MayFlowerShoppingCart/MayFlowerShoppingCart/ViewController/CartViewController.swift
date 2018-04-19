//
//  CartViewController.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/19/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    
    
    
    
    
    
    
    
    var item :[Item] = []

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
 // Mark:- Helper Method For total pric, add item, remove item

extension CartViewController{
    func totalPrice()-> Float{
        
        return 1.0
    }
    func addItem(items:Item){
        item.append(items)
        
        
    }
    
    func productAtIndexPath(indexPath: NSIndexPath) -> Item {
        return item[indexPath.row]
    }
    func removeItem( items :Item){
        
        
    }
    
}
