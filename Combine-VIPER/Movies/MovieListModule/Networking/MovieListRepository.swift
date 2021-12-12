//
//  MovieListRepository.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListRepository: RepositoryInterface {
  let persistence: Persistence
  
  required init(persistence: Persistence) {
    self.persistence = persistence
  }
}
