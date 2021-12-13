//
//  ServiceResponse.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation

struct ServiceResponse<T>: Codable where T: Codable {
  var status: String?
  var code: Int?
  var result: T?

  init(result: T) {
    self.result = result
  }
}

struct ServiceArrayResponse<T>: Codable where T: Codable {
  var status: String?
  var code: Int?
  var results: [T]?
  
  init(results: [T]) {
    self.results = results
  }
}
