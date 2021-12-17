//
//  MovieDetail.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation

struct MovieDetail: Codable {
  let id: Int
  var title: String
  let poster_path: String
  let genres: [Genre]?
  let homepage: String?
  let overview: String?
  let release_date: String?
  let runtime: Int?
  let languages: [Language]?
  let status: ReleaseStatus?
  let vote_average: Float?
  let vote_count: Int?
  let production_companies: [ProductionCompany]?
  let production_countries: [ProductionCountry]?
  let adult: Bool?
}
