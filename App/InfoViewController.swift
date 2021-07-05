//
//  InfoViewController.swift
//  App
//
//  Created by Ricardo Trevino on 7/1/21.
//

import Foundation
import UIKit
import Kingfisher


class InfoViewController: UIViewController {
    
    var cryptoInfo: Crypto
    
    init(crypto: Crypto) {
        cryptoInfo = crypto
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
            
            view = UIView()
            view.backgroundColor = .blue
            
            let stackView: UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                stack.alignment = .fill
                stack.distribution = .fillEqually
                return stack
            }()
            
            let _: UIImageView = {
               let imageView = UIImageView(image: nil)
               let url = URL(string: cryptoInfo.image)
               imageView.kf.setImage(with: url)
               imageView.contentMode = .scaleAspectFit
               imageView.clipsToBounds = true
               stackView.addArrangedSubview(imageView)
               return imageView
           }()
        
            let _: UILabel = {
                let label = UILabel()
                label.text = "Name: \(cryptoInfo.id)"
                label.textColor = .black
                label.font = UIFont.boldSystemFont(ofSize: 16)
                label.textAlignment = .left
                stackView.addArrangedSubview(label)
                return label
            }()
            
            let _: UILabel = {
                let label = UILabel()
                label.text = "Price: \(cryptoInfo.price)"
                label.textColor = .black
                label.font = UIFont.boldSystemFont(ofSize: 16)
                label.textAlignment = .left
                stackView.addArrangedSubview(label)
                return label
            }()
            
            let _: UILabel = {
                let label = UILabel()
                label.text = "Market Cap: \(cryptoInfo.market_cap)"
                label.textColor = .black
                label.font = UIFont.boldSystemFont(ofSize: 16)
                label.textAlignment = .left
                stackView.addArrangedSubview(label)
                return label
            }()
            
            view.addSubview(stackView)
        
            stackView.snp.makeConstraints { (make) in
                make.top.left.bottom.right.equalToSuperview()
                   
            }
        }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
}
