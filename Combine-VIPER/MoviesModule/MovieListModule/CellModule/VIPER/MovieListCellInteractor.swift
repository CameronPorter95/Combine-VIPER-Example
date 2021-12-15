//
//  MovieListCellInteractor.swift
//  Combine-VIPER
//
//  Created by Cam on 15/12/21.
//

import Foundation
import Combine
import UIKit

class MovieListCellInteractor: InteractorInterface {
  internal var model: MovieListCellModel
  internal let provider: MovieListCellProvider
  private var cancellables = Set<AnyCancellable>()
  
  @Published var detail: MovieListCellDetail?
  @Published var poster: UIImage?
  
  required init(model: MovieListCellModel, provider: MovieListCellProvider) {
    self.model = model
    self.provider = provider
    
    model.$detail
      .compactMap { $0 }
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
    
    model.$poster
      .assign(to: \.poster, on: self)
      .store(in: &cancellables)
    
    provider.$poster
      .assign(to: \.model.poster, on: self)
      .store(in: &cancellables)
    
    getPoster()
  }
  
  func getPoster() {
    guard let path = detail?.poster_path else { return }
    Task {
      await provider.getPoster(for: path)
    }
  }
}
