//
//  LayoutAnchor.swift
//  Combine-VIPER
//
//  Created by Cam on 17/12/21.
//

import Foundation
import UIKit

enum LayoutAnchor: String {
  case top
  case left
  case bottom
  case right
  case centerY
  case centerX
  case width
  case height
}

extension Array where Element: NSLayoutConstraint {
  subscript(anchor: LayoutAnchor) -> NSLayoutConstraint? {
    switch anchor {
    case .top:
        return self.filter { $0.identifier == LayoutAnchor.top.rawValue }.first
    case .bottom:
        return self.filter { $0.identifier == LayoutAnchor.bottom.rawValue }.first
    case .left:
        return self.filter { $0.identifier == LayoutAnchor.left.rawValue }.first
    case .right:
        return self.filter { $0.identifier == LayoutAnchor.right.rawValue }.first
    case .centerY:
        return self.filter { $0.identifier == LayoutAnchor.centerY.rawValue }.first
    case .centerX:
        return self.filter { $0.identifier == LayoutAnchor.centerX.rawValue }.first
    case .width:
        return self.filter { $0.identifier == LayoutAnchor.width.rawValue }.first
    case .height:
        return self.filter { $0.identifier == LayoutAnchor.height.rawValue }.first
    }
  }
}
