//
//  MovieListModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListModel: ModelInterface {
  @Published var movies = [MovieListCellModel]()
}
