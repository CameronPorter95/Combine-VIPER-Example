//
//  MovieListInteractor.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListInteractor: InteractorInterface {
  internal let model: MovieListModel
  internal let provider: MovieListProvider
  
  init(model: MovieListModel, provider: MovieListProvider) {
    self.model = model
    self.provider = provider
  }
}
