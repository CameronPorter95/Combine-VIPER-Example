//
//  MovieImageRepository.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import UIKit

class MovieImageRepository: Repository<MovieImageService>, RequestDecodable {
  
  func getPoster(for path: String) async throws -> UIImage {
    return try await asyncImage(.getPoster(path))
  }
}
