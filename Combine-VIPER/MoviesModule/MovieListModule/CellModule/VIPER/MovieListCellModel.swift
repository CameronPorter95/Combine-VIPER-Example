//
//  MovieListCellModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListCellModel: ModelInterface {
  @Published var detail: MovieListCellDetail
  @Published var poster: UIImage?
  
  init(detail: MovieListCellDetail) {
    self.detail = detail
  }
}
