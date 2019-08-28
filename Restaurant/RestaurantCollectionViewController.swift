//
//  RestaurantCollectionViewController.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/30/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

class RestaurantCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "restaurant_cell"
    var viewModels = [RestaurantListViewModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var yelpAPIHandler = YelpServiceAPIHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(whenBackIsTapped(sender:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Food"
        navigationController?.isNavigationBarHidden = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView?.setCollectionViewLayout(layout, animated: true)
        collectionView?.backgroundColor = .white
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(RestaurantHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "restaurant_header")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
    }
    
    @objc func whenBackIsTapped(sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RestaurantCollectionViewCell
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        yelpAPIHandler.getDetails(id: viewModels[indexPath.row].id) { (details, error) in
            DispatchQueue.main.async {
                let detailsView = DetailsViewController()
                detailsView.setDetails(price: details?.price, isOpen: details?.isOpen, phone: details?.phone, rating: details?.rating)
                detailsView.photosCollection = details?.imageUrls
                self.navigationController?.pushViewController(detailsView, animated: true)
            }
        }
    }
 
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "restaurant_header", for: indexPath) as! RestaurantHeaderCollectionReusableView
            headerView.header.text = "Restaurants"
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 20, height: 260)
      
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
}
