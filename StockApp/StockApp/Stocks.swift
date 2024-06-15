//
//  Stocks.swift
//  StockApp
//
//  Created by Apple on 07/06/24.
//

import Foundation

class Stocks  : Codable {
    
    let change : Double?
    let close : Double?
    let date : String?
    let high : Double?
    let low : Double?
    let price  : Double?
    let sid: String?
    let volume : Double?

    
    init(dict : NSDictionary) {
        
        change = dict["change"] as? Double
        close = dict["close"] as? Double
        date = dict["date"] as? String
        high = dict["high"] as? Double
        low = dict["low"] as? Double
        price = dict["price"] as? Double
        sid = dict["sid"] as? String
        volume = dict["volume"] as? Double
        
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.change = try container.decodeIfPresent(Double.self, forKey: .change)
        self.close = try container.decodeIfPresent(Double.self, forKey: .close)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.high = try container.decodeIfPresent(Double.self, forKey: .high)
        self.low = try container.decodeIfPresent(Double.self, forKey: .low)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.sid = try container.decodeIfPresent(String.self, forKey: .sid)
        self.volume = try container.decodeIfPresent(Double.self, forKey: .volume)
    }
    
    
    
}
