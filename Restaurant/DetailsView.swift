//
//  DetailsView.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/30/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(parentView)
        parentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        parentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        parentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        parentView.heightAnchor.constraint(equalToConstant: 960).isActive = true
        
        parentView.addSubview(stack)
        stack.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: parentView.heightAnchor).isActive = true
        
        stack.addArrangedSubview(collectionView)
        stack.addArrangedSubview(middleView)
        stack.addArrangedSubview(mapView)
        
        addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        
        middleView.addSubview(fullStack)
        fullStack.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 20).isActive = true
        fullStack.bottomAnchor.constraint(equalTo: middleView.bottomAnchor, constant: -20).isActive = true
        fullStack.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20).isActive = true
        fullStack.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20).isActive = true
        
        fullStack.addArrangedSubview(stack1)
        fullStack.addArrangedSubview(stack2)
        fullStack.addArrangedSubview(stack3)
        fullStack.addArrangedSubview(stack4)
        
        stack1.addArrangedSubview(image1)
        stack1.addArrangedSubview(label1)
        
        stack2.addArrangedSubview(image2)
        stack2.addArrangedSubview(label2)
        
        stack3.addArrangedSubview(image3)
        stack3.addArrangedSubview(label3)
        
        stack4.addArrangedSubview(image4)
        stack4.addArrangedSubview(label4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    public var parentView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.isScrollEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return collectionView
    }()
    
    public var pageControl: UIPageControl = {
        var pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.tintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .black
        pageControl.isEnabled = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    public var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 177).isActive = true
        return view
    }()
    
    public var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 200), for: .vertical)
        return view
    }()
    
    public var stack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var fullStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var stack2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var stack3: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var stack4: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var image1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_dollar")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var image2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_query")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var image3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_store")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var image4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_star")
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public var label1: UILabel = {
        let label = UILabel()
        label.text = "Dollar"
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var label2: UILabel = {
        let label = UILabel()
        label.text = "Store"
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var label3: UILabel = {
        let label = UILabel()
        label.text = "Query"
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var label4: UILabel = {
        let label = UILabel()
        label.text = "Star"
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
