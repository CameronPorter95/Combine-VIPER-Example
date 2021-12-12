//
//  View.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 12/12/21.
//

import Foundation
import UIKit
import Combine

class View: UIView, ViewInterface, NibType {
  @IBOutlet var view: UIView!
  
  internal let presenter: MovieListPresenter
  internal var cancellables = Set<AnyCancellable>()
  
  init(frame: CGRect, presenter: MovieListPresenter) {
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
  
  internal func refresh() {
    fatalError("refresh has not been implemented")
  }
}
