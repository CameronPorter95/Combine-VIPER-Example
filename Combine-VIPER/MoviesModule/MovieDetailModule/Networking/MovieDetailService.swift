//
//  MovieDetailService.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Moya

enum MovieDetailService {
  case getDetail(Int)
}

extension MovieDetailService: Api3Service {
  var path: String {
    switch self {
    case .getDetail(let id):
      return "/movie/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getDetail:
      return .get
    }
  }
}
