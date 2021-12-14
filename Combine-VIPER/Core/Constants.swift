//
//  Constants.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation

struct Constants {
  static var api3BaseURL: String {
    return Bundle.main.object(forInfoDictionaryKey: "Api3BaseURL") as! String
  }
  
  static var imagebaseURL: String {
    return Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as! String
  }
  
  static var apiKey: String {
    return Bundle.main.object(forInfoDictionaryKey: "ApiKey") as! String
  }
}
