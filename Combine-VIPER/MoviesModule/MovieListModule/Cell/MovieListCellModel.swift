//
//  MovieListCellModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

struct MovieListCellModel {
  var detail: MovieListCellDetail
  var poster: UIImage?
  
  init(detail: MovieListCellDetail) {
    self.detail = detail
  }
}
