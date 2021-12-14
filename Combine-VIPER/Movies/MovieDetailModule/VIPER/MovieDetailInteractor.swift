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
    
    provider.$poster
      .compactMap { $0 }
      .assign(to: \.model.poster, on: self)
      .store(in: &cancellables)
    
    Task {
      await getDetail()
      await getPoster()
    }
  }
  
  func getDetail() async {
    await provider.getDetail(for: model.id)
  }
  
  func getPoster() async {
    if let path = model.detail?.poster_path {
      await provider.getPoster(for: path)
    }
  }
}
