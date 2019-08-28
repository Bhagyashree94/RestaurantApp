//
//  MainView.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/29/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(mainStack)
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        mainStack.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        mainStack.addArrangedSubview(imageView)
        mainStack.addArrangedSubview(labelStackView)
        
        labelStackView.addArrangedSubview(label1)
        labelStackView.addArrangedSubview(label2)
        
        addSubview(ButtonStackView)
        ButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        ButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        ButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        
        ButtonStackView.addArrangedSubview(allowButton)
        ButtonStackView.addArrangedSubview(noButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location-permission")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var label1: UILabel = {
        let label = UILabel()
        label.text = "Need your location"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var label2: UILabel = {
        let label = UILabel()
        label.text = "Please give us access to your GPS location"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var ButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var allowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Allow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.init(hex: "FF2600")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var noButton: UIButton = {
        let button = UIButton()
        button.setTitle("No, Another time", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 100
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
