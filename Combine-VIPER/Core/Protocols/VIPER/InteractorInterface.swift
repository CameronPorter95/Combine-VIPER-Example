//
//  Interactor.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

protocol InteractorInterface: AnyObject {
  associatedtype Model: ModelInterface
  
  var model: Model { get }
}
