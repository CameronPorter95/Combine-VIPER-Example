//
//  MovieListCellModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListCellModel: ModelInterface {
  @Published var title: String
  
  init(title: String) {
    self.title = title
  }
}
