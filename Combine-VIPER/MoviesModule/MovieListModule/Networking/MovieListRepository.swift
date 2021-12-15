//
//  MovieListRepository.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListRepository: Repository<MovieListService>, RequestDecodable {
  
  func getMovies() async throws -> [MovieListCellDetail] {
    return try await asyncArray(.getMovies)
  }
}
