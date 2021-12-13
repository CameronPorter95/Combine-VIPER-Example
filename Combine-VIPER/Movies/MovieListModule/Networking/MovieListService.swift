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
}
