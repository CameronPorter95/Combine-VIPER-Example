//
//  TargetType.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import Moya

extension TargetType {
  
  var baseURL: URL {
    URL(string: "\(Constants.baseURL)")!
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
  
  var sampleData: Data {
    let url = Bundle.main.url(forResource: requestKey(), withExtension: "json")!
    return try! Data(contentsOf: url)
  }
  
  func requestKey() -> String {
    var key = path.replacingOccurrences(of: "/", with: ".")
    key.append(".\(method.rawValue)")
    return key
  }
}
