//
//  ServiceProvider.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import Moya

class ServiceProvider<T: TargetType>: MoyaProvider<T> {
  
  init(plugins: [PluginType] = []) {
    super.init(plugins: plugins)
  }
  
  static func instance() -> ServiceProvider {
    let plugins: [PluginType] = [
      AuthPlugin(),
//      NetworkLoggerPlugin(configuration: .init(logOptions: [.successResponseBody]))
    ]
    return ServiceProvider(plugins: plugins)
  }
}
