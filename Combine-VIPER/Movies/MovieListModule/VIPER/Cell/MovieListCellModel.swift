//
//  MovieListCellModel.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

class MovieListCellModel: ModelInterface, Codable {
  @Published var title: String
  
  init(title: String) {
    self.title = title
  }
  
  required init() {
    title = ""
  }
  
  enum CodingKeys: String, CodingKey {
    case title = "title"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    title = try container.decode(String.self, forKey: .title)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(title, forKey: .title)
  }
}
