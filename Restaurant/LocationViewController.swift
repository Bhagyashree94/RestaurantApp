//
//  ViewController.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/29/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

protocol LocationActions: class{
    func didTapAllowButton()
}

class LocationViewController: UIViewController {
    
    lazy var mainView: MainView = {
        let view = MainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var locationService: LocationService?
    weak var delegate: LocationActions?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(mainView)
        
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.allowButton.addTarget(self, action: #selector(didTapAllowButton(sender:)), for: .touchUpInside)
    
    }
    
    @objc func didTapAllowButton(sender: UIButton){
        self.delegate?.didTapAllowButton()
        navigationController?.pushViewController(RestaurantCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
}

