//
//  RestaurantCollectionViewCell.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/30/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(parentView)
        parentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        parentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        parentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        parentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        parentView.addSubview(topStack)
        topStack.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 20).isActive = true
        topStack.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -20).isActive = true
        topStack.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 10).isActive = true
        topStack.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10).isActive = true
        
        topStack.addArrangedSubview(imageView)
        topStack.addArrangedSubview(bottomStack)
        
        bottomStack.addArrangedSubview(restoLabel)
        bottomStack.addArrangedSubview(distanceStack)
        
        distanceStack.addArrangedSubview(distanceIcon)
        distanceStack.addArrangedSubview(distanceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder (aDecoder) has not been implemented")
    }
    
    func configure(with viewModel: RestaurantListViewModel){
        let url = viewModel.imageUrl
        let data = try? Data(contentsOf: url)
        imageView.image = UIImage(data: data!)
        restoLabel.text = viewModel.name
        distanceLabel.text = viewModel.formattedDistance
    }
    
    public var parentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var topStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: .vertical)
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public var distanceStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var distanceIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "marker")
        image.heightAnchor.constraint(equalToConstant: 24).isActive = true
        image.widthAnchor.constraint(equalToConstant: 24).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public var distanceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var bottomStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var restoLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: .horizontal)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
}
