//
//  AuthPlugin.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import Moya

class AuthPlugin: PluginType {
  
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    guard let urlString = request.url?.absoluteString,
    let method = request.method,
    var urlComponents = URLComponents(string: urlString) else {
      return request
    }
    
    let queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey)]
    urlComponents.queryItems = urlComponents.queryItems ?? []
    urlComponents.queryItems?.append(contentsOf: queryItems)
    
    if let url = urlComponents.url,
    let request = try? URLRequest(url: url, method: method, headers: request.headers) {
      return request
    } else {
      return request
    }
  }
}
