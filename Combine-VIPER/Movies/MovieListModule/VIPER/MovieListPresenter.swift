//
//  MovieListPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListPresenter: PresenterInterface, ObservableObject {
  internal let interactor: MovieListInteractor
  internal let router = MovieListRouter()
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var movies = [MovieListCellModel]()
  
  init(interactor: MovieListInteractor) {
    self.interactor = interactor
    
    interactor.$movies
      .dropFirst()
      .assign(to: \.movies, on: self)
      .store(in: &cancellables)
  }
}
