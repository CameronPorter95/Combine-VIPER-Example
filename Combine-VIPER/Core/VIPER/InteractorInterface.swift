//
//  Interactor.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

protocol InteractorInterface: VIPERInterface {
  associatedtype Model: ModelInterface
  
  var model: Model { get }
}
