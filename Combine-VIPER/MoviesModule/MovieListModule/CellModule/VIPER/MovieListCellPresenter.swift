//
//  MovieListCellPresenter.swift
//  Combine-VIPER
//
//  Created by Cam on 15/12/21.
//

import Foundation
import Combine
import UIKit

class MovieListCellPresenter: PresenterInterface, ObservableObject {
  internal let interactor: MovieListCellInteractor
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var detail: MovieListCellDetail?
  @Published var poster: UIImage?
  
  required init(interactor: MovieListCellInteractor) {
    self.interactor = interactor
    
    interactor.$detail
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
    
    interactor.$poster
      .assign(to: \.poster, on: self)
      .store(in: &cancellables)
  }
}
