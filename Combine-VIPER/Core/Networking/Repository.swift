//
//  Repository.swift
//  Combine-VIPER
//
//  Created by Cam on 13/12/21.
//

import Foundation
import Moya

class Repository<T: TargetType>: RepositoryInterface, Requestable {
  typealias Request = T
  
  let persistence: Persistence
  
  required init(persistence: Persistence) {
    self.persistence = persistence
  }
}
