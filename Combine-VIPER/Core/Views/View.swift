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
  
  required init(presenter: P) {
    self.presenter = presenter
    super.init(frame: .zero)
    nibInit()
    
    NSLayoutConstraint.activate([
      view.leftAnchor.constraint(equalTo: leftAnchor),
      view.rightAnchor.constraint(equalTo: rightAnchor),
      view.topAnchor.constraint(equalTo: topAnchor),
      view.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    presenter.objectWillChange
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: refresh)
      .store(in: &cancellables)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  internal func refresh(output: P.ObjectWillChangePublisher.Output) {
    fatalError("init(coder:) has not been implemented")
  }
}

class MainView<P: MainPresenterInterface>: View<P> {
  internal override func refresh(output: P.ObjectWillChangePublisher.Output) {
    presenter.errors.enumerated().forEach { error in
      let notice = Notice(type: .error(), title: error.element.localizedDescription)
      ErrorNotice.show(onto: self, using: notice)
      presenter.errors.remove(at: error.offset)
    }
  }
}
