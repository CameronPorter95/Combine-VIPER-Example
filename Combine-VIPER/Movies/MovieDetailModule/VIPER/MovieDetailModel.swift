//
//  MovieDetailModel.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine
import UIKit

class MovieDetailModel: ModelInterface {
  let id: Int
  @Published var detail: MovieDetail?
  @Published var poster: UIImage?
  
  init(id: Int) {
    self.id = id
  }
}
