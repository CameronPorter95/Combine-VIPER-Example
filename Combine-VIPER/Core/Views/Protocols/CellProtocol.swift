//
//  CellProtocol.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import UIKit

protocol CellProtocol: UIView {
  associatedtype ModelType

  func render(_ model: ModelType)

  static var reuseIdentifier: String { get }
}

extension CellProtocol {
  static var reuseIdentifier: String {
    return String(describing: Self.self).components(separatedBy: ".").last!
  }
}
