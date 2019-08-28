//
//  YelpServices.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/31/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import Foundation
import CoreLocation

struct YelpServices: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    var id: String
    var name: String
    var imageUrl: URL
    var distance: Double
}

struct RestaurantListViewModel {
    let name: String
    let imageUrl: URL
    let distance: Double
    let id: String
    
    static var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }
    
    var formattedDistance: String? {
        return RestaurantListViewModel.numberFormatter.string(from: distance as NSNumber)
    }
}

struct Details: Decodable {
    let price: String
    let phone: String
    let isClosed: Bool
    let rating: Double
    let name: String
    let photos: [URL]
    let coordinates: CLLocationCoordinate2D
}

struct RestaurantDetailsViewModel {
    let price: String
    let isOpen: String
    let phone: String
    let rating: String
    let imageUrls: [URL]
    let coordinates: CLLocationCoordinate2D
}

extension RestaurantListViewModel {
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        self.imageUrl = business.imageUrl
        self.distance = business.distance / 1609
    }
}

extension RestaurantDetailsViewModel {
    init(details: Details) {
        self.price = details.price
        self.isOpen = details.isClosed ? "Closed" : "Open"
        self.phone = details.phone
        self.rating = "\(details.rating) / 5"
        self.imageUrls = details.photos
        self.coordinates = details.coordinates
    }
}

extension CLLocationCoordinate2D: Decodable {
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}
