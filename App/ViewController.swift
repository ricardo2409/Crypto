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
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        refreshControl.tintColor = UIColor(.blue)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        tableView.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
        }
        
        viewModel.fetchCrypto { [weak self] cryptos in
            guard let strongSelf = self else { return }
            
            strongSelf.display(cryptos)
        }
        
    }
    
    func display(_ cryptos: [Crypto]) {
        self.cryptosArray = cryptos
        for (index, _) in cryptos.enumerated() {
            self.cryptosArray[index] = cryptos[index]
        }
        
        self.tableView.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        print("Refresh")
        viewModel.fetchCrypto { [weak self] cryptos in
            guard let strongSelf = self else { return }
            
            strongSelf.display(cryptos)
            strongSelf.refreshControl.endRefreshing()
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue a view controller
        let controller = InfoViewController(crypto: cryptosArray[indexPath.row])
        //controller.cryptoInfo = cryptosArray[indexPath.row]
        show(controller, sender: Any?.self)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
