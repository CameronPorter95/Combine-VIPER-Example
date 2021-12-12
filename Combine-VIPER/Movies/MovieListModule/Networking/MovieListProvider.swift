//
//  MovieListProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListProvider: ProviderInterface {
  let repository: MovieListRepository
  
  @Published var movies = [MovieListCellModel]()
  
  init(repository: MovieListRepository) {
    self.repository = repository
  }
  
  func getMovies() {
    movies = [MovieListCellModel(title: "Henry"), MovieListCellModel(title: "Kane")]
  }
}
