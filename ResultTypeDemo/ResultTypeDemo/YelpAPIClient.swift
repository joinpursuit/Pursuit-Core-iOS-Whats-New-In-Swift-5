//
//  YelpAPIClient.swift
//  ResultTypeDemo
//
//  Created by Alex Paul on 7/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case badURL
  case badStatusCode
  case apiError
}

class YelpAPIClient {
  // Result type in Swift 5 in a generic enum used on asychrousnous calls,
  // the Result is an enum that validates a .success or .failure against the call
  public func searchBusinesses(completion: @escaping (Result<Int, NetworkError>) -> Void) {
    let endPointURL = "https://api.yelp.com/v3/businesses/search?term=coffee&location=10023"
    guard let url = URL(string: endPointURL) else {
      return
    }
    var request = URLRequest(url: url)
    let accessToken = "API Key Here"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let _ = error {
        completion(.failure(.apiError))
      } else if let _ = data {
        completion(.success(200))
      }
    }
    task.resume()
  }
}
