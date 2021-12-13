//
//  CollectionHelpers.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
  subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
