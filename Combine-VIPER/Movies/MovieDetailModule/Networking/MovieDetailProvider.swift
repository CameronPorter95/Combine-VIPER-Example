//
//  MovieDetailProvider.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation

class MovieDetailProvider: ProviderInterface {
  let repository: MovieDetailRepository
  
  @Published var errors = [Error]()
  @Published var detail: MovieDetail?
  
  required init(repository: MovieDetailRepository) {
    self.repository = repository
  }
  
  func getDetail(for id: Int) async {
    do {
      detail = try await repository.getDetail(for: id)
    } catch {
      errors.append(error)
    }
  }
}
