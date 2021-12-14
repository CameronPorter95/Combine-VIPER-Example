//
//  RequestDecodable.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation
import Moya
import UIKit

protocol RequestDecodable: Requestable {
  
}

extension RequestDecodable {
  func asyncObject<T: Codable>(_ target: Request) async throws -> T {
    let response = try await future(target)
    guard let object = try? response.map(T.self) else {
      throw MoyaError.jsonMapping(response)
    }
    return object
  }
  
  func asyncArray<T: Codable>(_ target: Request) async throws -> [T] {
    let response = try await future(target)
    guard let array = try response.map(ServiceArrayResponse<T>.self).results else {
      throw MoyaError.jsonMapping(response)
    }
    return array
  }
  
  func asyncImage(_ target: Request) async throws -> UIImage {
    let response = try await future(target)
    guard let image = try? response.mapImage() as UIImage else {
      throw MoyaError.jsonMapping(response)
    }
    return image
  }
}
