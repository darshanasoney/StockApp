//
//  Services.swift
//  StockApp
//
//  Created by Apple on 07/06/24.
//

import Foundation


enum APIError : Error {
    case noData
    case parseError(Error)
}

final class Services {
    
    static let instance = Services()
    
    
    let url = ""
    
    private init() {}
    
    func getStocks(completionHandler: @escaping (Result <[Stocks], APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completionHandler(.failure(.noData))
            return
        }
        
        let urlReq = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlReq) { data, response, error in
            if let error = error {
                completionHandler(.failure(.parseError(error)))
            }
            
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            do {
                
                if let objData = try JSONSerialization.jsonObject(with: data) as? NSDictionary {
                    
                    if let stockAry = objData["data"] as? [NSDictionary] {
                        
//                        let stockArry = stockAry.map { obj in
//                            return Stocks(dict: obj)
//                        }
                        
                        let stockData = try JSONSerialization.data(withJSONObject: stockAry)
                        
                        let decodedData = try JSONDecoder().decode([Stocks].self, from: stockData)
                        completionHandler(.success(decodedData))
                        
//                        completionHandler(.success(stockArry))
                    }
                }
                
            } catch {
                completionHandler(.failure(.parseError(error)))
            }
        }.resume()
        
    }
    
}
