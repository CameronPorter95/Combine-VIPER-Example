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

///A presenter which as used on the primary/base module of a given screen
protocol MainPresenterInterface: PresenterInterface {
  var errors: [Error] { get set }
}
