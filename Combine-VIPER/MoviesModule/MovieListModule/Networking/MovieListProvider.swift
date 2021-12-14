//
//  MovieListProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListProvider: ProviderInterface {
  let repository: MovieListRepository
  
  @Published var errors = [Error]()
  @Published var movies = [MovieListCellModel]()
  
  required init(repository: MovieListRepository) {
    self.repository = repository
  }
  
  func getMovies() async {
    do {
      movies = try await repository.getMovies()
    } catch {
      errors.append(error)
    }
  }
}
