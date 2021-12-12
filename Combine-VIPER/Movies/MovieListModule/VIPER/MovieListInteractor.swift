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
  private var cancellables = Set<AnyCancellable>()
  
  @Published var movies = [MovieListCellModel]()
  
  init(model: MovieListModel, provider: MovieListProvider) {
    self.model = model
    self.provider = provider
    
    model.$movies
      .assign(to: \.movies, on: self)
      .store(in: &cancellables)
    
    provider.$movies
      .assign(to: \.model.movies, on: self)
      .store(in: &cancellables)
  }
  
  func getMovies() {
    provider.getMovies()
  }
}
