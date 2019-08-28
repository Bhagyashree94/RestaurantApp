//
//  YelpServiceAPIHandler.swift
//  Restaurant
//
//  Created by Bhagyashree Gawade on 7/31/19.
//  Copyright © 2019 Bhagyashree Gawade. All rights reserved.
//

import Foundation

class YelpServiceAPIHandler: NSObject {

    let ApiKey = "u_EuPi6rPZbNlddpFg5Ld0MamHj9vdAwND2p3pq-y68fBlm4uqrBXg-U9nTxmFjIsFYtxvPoH5LhNCnhMbOeZWQJuj0s0UM4QSwiVWpQxz09agbmoqE2tDkg5vNBXXYx"
    let jsonDecoder = JSONDecoder()

    var headers: [String: String]?

    func getYelpData(lat: Double, lng: Double, completionHandler: @escaping ([RestaurantListViewModel]?, Error?) -> Void) {

        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        var url = URLComponents(string: "https://api.yelp.com/v3/businesses/search")!
        headers = ["Authorization": "Bearer \(ApiKey)"]

        url.queryItems = [ URLQueryItem(name: "latitude", value: lat.description),
                                  URLQueryItem(name: "longitude", value: lng.description) ]

        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"

        request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            let model = try? self.jsonDecoder.decode(YelpServices.self, from: data)
                let viewModels = model?.businesses
                    .compactMap(RestaurantListViewModel.init)
                    .sorted(by: {$0.distance < $1.distance})
            completionHandler(viewModels, nil)
        }
        task.resume()
    }
    
    func getDetails(id: String, completionHandler: @escaping (RestaurantDetailsViewModel?, Error?) -> Void) {
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let url = URLComponents(string: "https://api.yelp.com/v3/businesses/\(id)")!
        headers = ["Authorization": "Bearer \(ApiKey)"]
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            
            let model = try? self.jsonDecoder.decode(Details.self, from: data)
            let detailsViewModel = RestaurantDetailsViewModel(details: model!)
            completionHandler(detailsViewModel, nil)
        }
        task.resume()
    }
}
