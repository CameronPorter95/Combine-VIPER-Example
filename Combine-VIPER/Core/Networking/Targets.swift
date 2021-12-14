//
//  Targets.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Moya

protocol Api3Service: TargetType { }

extension Api3Service {
  var baseURL: URL {
    URL(string: "\(Constants.api3BaseURL)")!
  }
}

protocol ImageService: TargetType { }

extension ImageService {
  var baseURL: URL {
    URL(string: "\(Constants.imagebaseURL)")!
  }
}
