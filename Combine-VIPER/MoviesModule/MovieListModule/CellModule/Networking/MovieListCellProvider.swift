//
//  MovieListCellProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 15/12/21.
//

import Foundation
import UIKit

class MovieListCellProvider: ProviderInterface {
  let repository: MovieImageRepository
  
  @Published var poster: UIImage?
  
  required init(repository: MovieImageRepository) {
    self.repository = repository
  }
  
  func getPoster(for path: String) async {
    do {
      poster = try await repository.getPoster(for: path)
    } catch {
      NotificationCenter.default.post(name: .movieListCellDidError, object: error)
    }
  }
}

extension Notification.Name {
  static let movieListCellDidError = Notification.Name(rawValue: "movieListCellDidError")
}
