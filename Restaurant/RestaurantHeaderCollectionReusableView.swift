//
//  RestaurantHeaderCollectionReusableView.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/30/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

class RestaurantHeaderCollectionReusableView: UICollectionReusableView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(header)
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        header.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        header.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        header.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    public var header: UILabel = {
        let label = UILabel()
        label.text = "Restaurants"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
