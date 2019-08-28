//
//  DetailsViewController.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/30/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    lazy var detailsView: DetailsView = {
        let view = DetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var photosCollection: [URL]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationItem.title = ""
        let backButton = UIBarButtonItem(title: "Restuarants", style: .plain, target: self, action: #selector(whenTappedOnBack(sender:)))
        navigationItem.leftBarButtonItem = backButton    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.heightAnchor.constraint(equalToConstant: 1024).isActive = true
        view.addSubview(detailsView)
        
        detailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        detailsView.collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell_details")
        detailsView.collectionView.delegate = self
        detailsView.collectionView.dataSource = self
    }
    
    @objc func whenTappedOnBack(sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
    
    func setDetails(price: String?, isOpen: String?, phone: String?, rating: String?){
        detailsView.label1.text = price
        detailsView.label2.text = isOpen
        detailsView.label3.text = phone
        detailsView.label4.text = rating
    }
}

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosCollection!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_details", for: indexPath) as! DetailsCollectionViewCell
        if let url = photosCollection?[indexPath.row] {
            let data = try? Data(contentsOf: url)
            cell.imageView.image = UIImage(data: data!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
  
}
