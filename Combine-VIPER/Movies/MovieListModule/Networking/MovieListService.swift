//
//  MovieListService.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation
import Moya

enum MovieListService {
  case getMovies
}

extension MovieListService: TargetType {
  var baseURL: URL { URL(string: "https://api.themoviedb.org/3")! }
  
  var path: String {
    switch self {
    case .getMovies:
      return "/movie/popular"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getMovies:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getMovies:
      return .requestParameters(parameters: ["api_key": Constants.apiKey], encoding: URLEncoding.queryString)
    }
  }
  
  var sampleData: Data {
    return Data("".utf8)
  }
  
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}
