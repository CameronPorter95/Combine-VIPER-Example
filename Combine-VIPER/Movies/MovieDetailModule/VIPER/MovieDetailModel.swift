//
//  MovieDetailModel.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine

class MovieDetailModel: ModelInterface {
  let id: Int
  @Published var detail: MovieDetail? {
    didSet {
      print(detail)
    }
  }
  
  init(id: Int) {
    self.id = id
  }
}
