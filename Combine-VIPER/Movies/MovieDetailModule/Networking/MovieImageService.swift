//
//  MovieImageService.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Moya

enum MovieImageService {
  case getPoster(String)
}

extension MovieImageService: ImageService {
  var path: String {
    switch self {
    case .getPoster(let path):
      return "/t/p/w500/\(path)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getPoster:
      return .get
    }
  }
}
