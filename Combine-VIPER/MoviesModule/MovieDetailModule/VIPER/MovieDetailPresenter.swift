//
//  MovieDetailPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine
import UIKit

class MovieDetailPresenter: PresenterInterface, ObservableObject {
  internal let interactor: MovieDetailInteractor
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var errors = [Error]()
  @Published var detail: MovieDetail?
  @Published var poster: UIImage?
  
  required init(interactor: MovieDetailInteractor) {
    self.interactor = interactor
    
    interactor.$detail
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
  
    interactor.$poster
      .assign(to: \.poster, on: self)
      .store(in: &cancellables)
    
    interactor.provider.$errors
      .assign(to: \.errors, on: self)
      .store(in: &cancellables)
  }
}
