//
//  Constants.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation

struct Constants {
  static var apiKey: String {
    return Bundle.main.object(forInfoDictionaryKey: "ApiKey") as! String
  }
}
