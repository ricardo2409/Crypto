//
//  CustomCell.swift
//  App
//
//  Created by Ricardo Trevino on 6/30/21.
//

import Foundation
import UIKit
import Kingfisher

class CustomCell: UITableViewCell {
    
    var crypto : Crypto? {
        didSet {
            if let crypto = crypto {
                let url = URL(string: crypto.image)
                cryptoImage.kf.setImage(with: url)
                cryptoIDLabel.text = "Name: \(crypto.id)"
                cryptoPriceLabel.text = "Current Price: \(crypto.price)"
                cryptoMarketCapLabel.text = "Market Cap: \(crypto.market_cap)"
            }
        }
    }
    
    private let cryptoIDLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let cryptoPriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let cryptoMarketCapLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let cryptoImage : UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [cryptoIDLabel, cryptoPriceLabel, cryptoMarketCapLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cryptoImage)
        addSubview(stackView)
        
        cryptoImage.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(50)
        }
    
        stackView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(cryptoImage.snp.right)
               
           }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
