//
//  MovieListModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListModel: ModelInterface {
  private var cancellables = Set<AnyCancellable>()
  @Published var movies = [MovieListCellModel]()
  
  required init() { }
}
