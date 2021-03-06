//
//  MovieListPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Combine

class MovieListPresenter: MainPresenterInterface, ObservableObject {
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
  
  func notifyMovieSelection(with cellModel: MovieListCellModel) {
    NotificationCenter.default.post(name: .didSelectMovie, object: cellModel)
  }
}

extension Notification.Name {
  static let didSelectMovie = Notification.Name(rawValue: "didSelectMovie")
}
