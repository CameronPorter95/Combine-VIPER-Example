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
  
//  func futureSequence(targets: [Service]) -> AsyncThrowingStream<Response, Error> {
//    var index = 0
//    let requester = Requester()
//
//    return AsyncThrowingStream {
//      guard index < targets.count else {
//        return nil
//      }
//
//      let target = targets[index]
//      index += 1
//
//      let response = try await requester.future(target)
//      return response
//    }
//  }
}

//class Requester: Requestable {
//  typealias Request = Service
//}
//
//class Service: TargetType {
//  var path: String {
//    return ""
//  }
//
//  var method: Moya.Method {
//    return .get
//  }
//}
