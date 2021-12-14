//
//  MovieDetailInteractor.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine

class MovieDetailInteractor: InteractorInterface {
  internal let model: MovieDetailModel
  internal let provider: MovieDetailProvider
  private var cancellables = Set<AnyCancellable>()
  
  @Published var detail: MovieDetail?
  
  required init(model: MovieDetailModel, provider: MovieDetailProvider) {
    self.model = model
    self.provider = provider
    
    model.$detail
      .assign(to: \.detail, on: self)
      .store(in: &cancellables)
    
    provider.$detail
      .compactMap { $0 }
      .assign(to: \.model.detail, on: self)
      .store(in: &cancellables)
    
    getDetail()
  }
  
  func getDetail() {
    Task {
      await provider.getDetail(for: model.id)
    }
  }
}
