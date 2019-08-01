//
//  ViewController.swift
//  ResultTypeDemo
//
//  Created by Alex Paul on 7/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private let apiClient = YelpAPIClient()
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBusinesses()
  }
  
  private func searchBusinesses() {
    apiClient.searchBusinesses { result in
      switch result {
      case .failure(let error):
        print("error: \(error)")
      case .success(let businesses):
        print("found \(businesses.count) businesses")
      }
    }
  }
}

// TODO: create a table view that shows at minimum the name of the business
// TODO: add UI so the user is able to change the zipcode search
// TODO: add a search bar so the user is able to search for a particular type of business
