//
//  MovieListProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit
import Combine

class MovieListProvider: ProviderInterface {
  let repository: MovieListRepository
  let imageRepository: MovieImageRepository
  
  @Published var errors = [Error]()
  @Published var movies = [MovieListCellModel]()
  
  required init(repository: MovieListRepository, imageRepository: MovieImageRepository) {
    self.repository = repository
    self.imageRepository = imageRepository
  }
  
  func getMovies() async {
    do {
      movies = try await repository.getMovies().map { MovieListCellModel(detail: $0) }
    } catch {
      errors.append(error)
    }
  }
  
  func getPoster(for path: String) async -> UIImage? {
    do {
      return try await imageRepository.getPoster(for: path)
    } catch {
      errors.append(error)
      return nil
    }
  }
}
