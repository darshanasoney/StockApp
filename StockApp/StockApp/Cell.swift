//
//  Cell.swift
//  StockApp
//
//  Created by Apple on 07/06/24.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(stock: Stocks) {
        
        self.lblHigh.text = "\(stock.high ?? 0)"
        self.lblLow.text = "\(stock.low ?? 0)"
        self.lblName.text = stock.sid
        self.lblPrice.text = "\(stock.price ?? 0)"
        self.lblVolume.text = "\(stock.volume ?? 0)"
        
    }
    
}
