//
//  ViewController.swift
//  StockApp
//
//  Created by Apple on 07/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableStocks : UITableView!
    
    var allStocks = [Stocks]()
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTheme()
        
        self.getAPIData()
        
    }
    
    func setTheme() {
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        
        self.tableStocks.register(nib, forCellReuseIdentifier: "Cell")
        self.tableStocks.dataSource = self
    }
    
    
    @objc func getAPIData() {
        
        Services.instance.getStocks { [weak self] result in
            switch result {
                
            case .success(let stocks):
                self?.allStocks = stocks
                DispatchQueue.main.async {
                    self?.tableStocks.reloadData()
                }
                break
               
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.getAPIData()
        }
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.stop()
    }
    
    func stop() {
        
    }

}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allStocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell {
            cell.populate(stock : self.allStocks[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.allStocks[indexPath.row].sid ?? "")
    }
    
}

