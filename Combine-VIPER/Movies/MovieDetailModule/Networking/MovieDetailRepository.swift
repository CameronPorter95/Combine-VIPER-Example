//
//  MovieDetailRepository.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation

class MovieDetailRepository: Repository<MovieDetailService>, RequestDecodable {
  
  func getDetail(for id: Int) async throws -> MovieDetail {
    return try await asyncObject(.getDetail(id))
  }
}
