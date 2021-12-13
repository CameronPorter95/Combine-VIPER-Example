//
//  Notice.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import UIKit

class Notice {
  let type: NoticeViewType
  let title: String?
  var message: String?
  var nextNotice: Notice?
  var action: (() -> Void)?
  
  init(type: NoticeViewType, title: String, message: String? = nil, action: (() -> Void)? = nil) {
    self.type = type
    self.title = title
    self.message = message
    self.action = action
  }
}

extension Array where Element: Notice {
  func showAll(onto view: UIView) {
    for (index, notice) in self.enumerated() {
      notice.nextNotice = self[safe: index + 1]
    }
    if let first = self.first {
      NoticeViewBase.show(onto: view, using: first)
    }
  }
}
