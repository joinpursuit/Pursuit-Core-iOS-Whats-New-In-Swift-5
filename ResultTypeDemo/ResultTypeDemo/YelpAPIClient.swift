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
  case apiError(Error)
  case jsonDecodingError(Error)
}

class YelpAPIClient {
  // Result type in Swift 5 in a generic enum used on asychrousnous calls,
  // the Result is an enum that validates a .success or .failure against the call
  public func searchBusinesses(completion: @escaping (Result<Int, NetworkError>) -> Void) {
    let endPointURL = "https://api.yelp.com/v3/bus inesses/search?term=coffee&location=10023"
    guard let url = URL(string: endPointURL) else {
      completion(.failure(.badURL))
      return
    }
    var request = URLRequest(url: url)
    let accessToken = "csB_Ku1PXZYemDnhcmy_NkGIXtC7eI-TGYmPztkXVavX1e1rYZ4o55tscsD_9ObULhsdTQdacovr3gf_5wn-7-4ag8CMYlInvz_nGS__H6IeaF1qJhhDRaV0Q5xYWnYx"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completion(.failure(.apiError(error)))
      } else if let data = data {
        // TODO: using JSONDecoder() parse data to [Business]
      }
    }
    task.resume()
  }
}
