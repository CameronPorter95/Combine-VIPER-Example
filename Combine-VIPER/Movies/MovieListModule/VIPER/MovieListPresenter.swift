//
//  MovieListPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListPresenter: PresenterInterface {
  internal let interactor: MovieListInteractor
  internal let router = MovieListRouter()
  
  init(interactor: MovieListInteractor) {
    self.interactor = interactor
  }
}
