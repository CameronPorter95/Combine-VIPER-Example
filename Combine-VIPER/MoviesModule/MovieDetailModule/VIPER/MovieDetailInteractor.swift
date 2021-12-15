//
//  MovieDetailInteractor.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine
import UIKit

class MovieDetailInteractor: InteractorInterface {
  internal let model: MovieDetailModel
  internal let provider: MovieDetailProvider
  private var cancellables = Set<AnyCancellable>()
  
  @Published var detail: MovieDetail?
  @Published var poster: UIImage?
  
  required init(model: MovieDetailModel, provider: MovieDetailProvider) {
    self.model = model
    self.provider = provider
    
    model.$id
      .sink { [weak self] id in
        self?.getDetail(for: id)
      }
      .store(in: &cancellables)
    
    model.$detail
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
    
    model.$poster
      .assign(to: \.poster, on: self)
      .store(in: &cancellables)
    
    provider.$detail
      .compactMap { $0 }
      .assign(to: \.model.detail, on: self)
      .store(in: &cancellables)
  }
  
  func getDetail(for id: Int?) {
    guard let id = id else { return }
    Task {
      await provider.getDetail(for: id)
    }
  }
}
