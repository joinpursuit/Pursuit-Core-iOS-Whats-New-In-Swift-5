//
//  Business.swift
//  ResultTypeDemo
//
//  Created by Alex Paul on 7/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct BusinessesSearch: Codable {
  let businesses: [Business]
}

struct Business: Codable {
  let id: String
  let alias: String
  let name: String
  let image_url: String
  let is_closed: Bool
  let url: String
  let rating: Double
  let location: Location
  let phone: String
  let coordinates: Coordinate
}
struct Coordinate: Codable {
  let latitude: Double
  let longitude: Double
}

struct Location: Codable {
  let address1: String
  let city: String
  let zip_code: String
  let country: String
  let state: String
}
