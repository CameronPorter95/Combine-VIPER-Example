//
//  MovieDetailPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine

class MovieDetailPresenter: PresenterInterface, ObservableObject {
  internal let interactor: MovieDetailInteractor
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var errors = [Error]()
  @Published var detail: MovieDetail?
  
  required init(interactor: MovieDetailInteractor) {
    self.interactor = interactor
    
    interactor.$detail
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
    
    interactor.provider.$errors
      .assign(to: \.errors, on: self)
      .store(in: &cancellables)
  }
}
