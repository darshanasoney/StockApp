//
//  StockDetailController.swift
//  StockApp
//
//  Created by Apple on 15/06/24.
//

import Foundation
import UIKit

class StockDetailController : UIViewController {
    
    @IBOutlet weak var lblName : UILabel!
    
    var stock : Stocks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stock = stock {
            self.lblName.text = stock.sid
        }
    }
    
}
