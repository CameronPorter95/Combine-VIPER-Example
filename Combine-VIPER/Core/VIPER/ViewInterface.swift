//
//  ViewProtocol.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

protocol ViewInterface: AnyObject, VIPERInterface {
  associatedtype Presenter: PresenterInterface
  
  var presenter: Presenter { get }
  
  init(presenter: Presenter)
}
