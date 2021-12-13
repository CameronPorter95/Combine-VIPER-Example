//
//  Constants.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation

struct Constants {
  static var baseURL: String {
    return Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
  }
  
  static var apiKey: String {
    return Bundle.main.object(forInfoDictionaryKey: "ApiKey") as! String
  }
}
