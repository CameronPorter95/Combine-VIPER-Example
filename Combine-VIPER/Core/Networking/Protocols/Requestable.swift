//
//  Providable.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
//import CombineMoya
import Moya
import Combine

///Allows making requests
protocol Requestable: AnyObject {
  associatedtype Request: TargetType
  
//  var cancellables: Set<AnyCancellable> { get set }
}

extension Requestable {
  func future(_ target: Request) async throws -> Response {
    return try await withCheckedThrowingContinuation({ continuation in
      MoyaProvider<Request>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .formatRequestAscURL))]).request(target) { result in
        switch result {
        case .success(let response):
          continuation.resume(returning: response)
        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    })
//    let provider = MoyaProvider<Request>()
//    return try await withCheckedThrowingContinuation({ continuation in
//      provider.requestPublisher(target)
//        .sink { completion in
//          guard case let .failure(error) = completion else { return }
//          continuation.resume(throwing: error)
//        } receiveValue: { response in
//          continuation.resume(returning: response)
//        }
//        .store(in: &cancellables)
//    })
  }
}
