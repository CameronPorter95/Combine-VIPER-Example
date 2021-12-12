//
//  Presenter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation

protocol PresenterInterface: VIPERInterface, ObservableObject {
  associatedtype Interactor: InteractorInterface
  
  var interactor: Interactor { get }
  
  init(interactor: Interactor)
}
