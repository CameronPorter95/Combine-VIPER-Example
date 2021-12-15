//
//  MovieListProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListProvider: ProviderInterface {
  let repository: MovieListRepository
  
  @Published var errors = [Error]()
  @Published var movies = [MovieListCellModel]()
  @Published var poster: UIImage?
  
  required init(repository: MovieListRepository) {
    self.repository = repository
  }
  
  func getMovies() async {
    do {
      movies = try await repository.getMovies().map { MovieListCellModel(detail: $0) }
    } catch {
      errors.append(error)
    }
  }
}
