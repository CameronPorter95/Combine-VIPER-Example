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
  
  @Published var errors = [Error]()
  @Published var movies = [MovieListCellModel]()
  
  required init(interactor: MovieListInteractor) {
    self.interactor = interactor
    
    interactor.$movies
      .assign(to: \.movies, on: self)
      .store(in: &cancellables)
    
    interactor.provider.$errors
      .assign(to: \.errors, on: self)
      .store(in: &cancellables)
  }
  
  func routeToDetail(for id: Int) {
    //TODO notify view controller of routing
    MovieListRouter().makeDetailView(for: id)
  }
}
