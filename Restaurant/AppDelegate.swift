//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/29/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let yelpServiceApiHandler = YelpServiceAPIHandler()
    var lat: Double? = 0.0
    var lng: Double? = 0.0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        locationService.didChangeStatus = { [weak self] success in
            if success {
                self?.locationService.getLocation()
            }
        }

        locationService.newLocation = { [weak self] result in
            switch result {
            case .success(let location):
                self?.yelpServiceApiHandler.getYelpData(lat: location.coordinate.latitude, lng: location.coordinate.longitude, completionHandler: { (viewModels, error) in
                    DispatchQueue.main.async {
                        guard let viewModels = viewModels  else {
                            print(error.debugDescription)
                            return
                        }
                        if let navController = self?.window?.rootViewController as? UINavigationController,
                            let restaurantlistViewController = navController.topViewController as? RestaurantCollectionViewController {
                            restaurantlistViewController.viewModels = viewModels
                        }
                    }
                })
            case.failure(let error):
                assertionFailure("Error getting the users location\(error)")
            }
        }
        
        switch locationService.status {
        case .notDetermined, .restricted, .denied:
            let locationViewController = LocationViewController()
            locationViewController.locationService = locationService
            locationViewController.delegate = self
            let navigationController = UINavigationController(rootViewController: locationViewController)
            navigationController.navigationBar.isTranslucent = false
            window?.rootViewController = navigationController
        default:
            let RestaurantViewController = RestaurantCollectionViewController(collectionViewLayout: UICollectionViewLayout())
            let navigationController = UINavigationController(rootViewController: RestaurantViewController)
            navigationController.navigationBar.isTranslucent = false
                self.window?.rootViewController = navigationController
            locationService.getLocation()
        }
        window?.makeKeyAndVisible()
      
        return true
    }

}

extension AppDelegate: LocationActions {
    func didTapAllowButton() {
        locationService.requestLocationAuthorization()
    }
}



