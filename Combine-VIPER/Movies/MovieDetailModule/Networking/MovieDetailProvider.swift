//
//  MovieDetailProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import UIKit

class MovieDetailProvider: ProviderInterface {
  let repository: MovieDetailRepository
  let imageRepository: MovieImageRepository
  
  @Published var errors = [Error]()
  @Published var detail: MovieDetail?
  @Published var poster: UIImage?
  
  required init(repository: MovieDetailRepository, imageRepository: MovieImageRepository) {
    self.repository = repository
    self.imageRepository = imageRepository
  }
  
  func getDetail(for id: Int) async {
    do {
      detail = try await repository.getDetail(for: id)
    } catch {
      errors.append(error)
    }
  }
  
  func getPoster(for path: String) async {
    do {
      poster = try await imageRepository.getPoster(for: path)
    } catch {
      errors.append(error)
    }
  }
}
