//
//  MovieListProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListProvider: ProviderInterface {
  let repository: MovieListRepository
  
  init(repository: MovieListRepository) {
    self.repository = repository
  }
}
