//
//  ProductTableViewCell.swift
//  MayFlowerShoppingCart
//
//  Created by globesoftmac2 on 4/17/18.
//  Copyright © 2018 shilpa.com. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productIdLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productDescLabel: UILabel!
<<<<<<< HEAD
    
    @IBOutlet weak var priceLABEL: UILabel!
=======
>>>>>>> aaf6f79f1c7592e3f41f9cfe4409a3152e6765d0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

<<<<<<< HEAD
  }
=======
    @IBAction func addToCartButtonTapped(_ sender: Any) {
    }
}
>>>>>>> aaf6f79f1c7592e3f41f9cfe4409a3152e6765d0
