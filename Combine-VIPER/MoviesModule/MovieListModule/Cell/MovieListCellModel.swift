//
//  MovieListCellModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

struct MovieListCellModel {
  var detail: MovieDetail
  var poster: UIImage?
  
  init(detail: MovieDetail) {
    self.detail = detail
  }
}
