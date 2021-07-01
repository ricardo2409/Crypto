//
//  ViewController.swift
//  App
//
//  Created by Ricardo Trevino on 6/29/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
   
    var view1 = UIView()
    var viewModel = ViewModel()
    let tableView = UITableView()
    var cryptosArray = [Crypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.center.height.width.equalToSuperview()
        }
        
        viewModel.fetchCrypto { cryptos in
            //las pongo en la table view
            self.cryptosArray = cryptos
            for (index, _) in cryptos.enumerated() {
                self.cryptosArray[index] = cryptos[index]
            }
            
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.crypto = cryptosArray[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
