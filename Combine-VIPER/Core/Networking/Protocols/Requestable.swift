//
//  Providable.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import Moya
import Combine

///Allows making requests
protocol Requestable: AnyObject {
  associatedtype Request: TargetType
}

extension Requestable {
  func future(_ target: Request) async throws -> Response {
    return try await withCheckedThrowingContinuation({ continuation in
      ServiceProvider<Request>.instance().request(target) { result in
        switch result {
        case .success(let response):
          continuation.resume(returning: response)
        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    })
  }
}
