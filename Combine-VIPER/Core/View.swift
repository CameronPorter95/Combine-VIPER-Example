//
//  View.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 12/12/21.
//

import Foundation
import UIKit
import Combine

class View<P>: UIView, ViewInterface, NibType where P: PresenterInterface {
  @IBOutlet var view: UIView!
  
  internal let presenter: P
  internal var cancellables = Set<AnyCancellable>()
  
  required init(frame: CGRect, presenter: P) {
    self.presenter = presenter
    super.init(frame: frame)
    nibInit()
    
    presenter.objectWillChange
      .sink(receiveValue: refresh)
      .store(in: &cancellables)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  internal func refresh(output: P.ObjectWillChangePublisher.Output) {
    fatalError("refresh has not been implemented")
  }
}
