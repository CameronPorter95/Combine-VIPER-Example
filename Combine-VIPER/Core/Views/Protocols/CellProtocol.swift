//
//  CellProtocol.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import UIKit

protocol ReusableCellProtocol: UIView {
  static var reuseIdentifier: String { get }
}

extension ReusableCellProtocol {
  static var reuseIdentifier: String {
    return String(describing: Self.self).components(separatedBy: ".").last!
  }
}

protocol CellProtocol: ReusableCellProtocol {
  associatedtype ModelType

  func render(_ model: ModelType)
}
