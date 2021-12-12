//
//  ProviderInterface.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

protocol ProviderInterface {
  associatedtype Repository

  var repository: Repository { get }
  
  init(repository: Repository)
}
