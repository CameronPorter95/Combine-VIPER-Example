//
//  MovieDetailModel.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import Combine
import UIKit

class MovieDetailModel: ModelInterface {
  private var cancellables = Set<AnyCancellable>()
  
  @Published var id: Int?
  @Published var detail: MovieDetail?
  @Published var poster: UIImage?
  
  init() {
    NotificationCenter.default.publisher(for: .didSelectMovie)
      .compactMap { $0.object as? Int }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
  }
}
