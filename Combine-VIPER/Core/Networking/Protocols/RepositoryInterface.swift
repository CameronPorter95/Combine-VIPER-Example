//
//  RepositoryInterface.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

protocol RepositoryInterface {
  var persistence: Persistence { get }
  
  init(persistence: Persistence)
}
