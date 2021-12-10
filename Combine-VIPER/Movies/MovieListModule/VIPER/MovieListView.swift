//
//  MovieListView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListView: UIView, ViewInterface, NibType {
  internal let presenter: MovieListPresenter
  @IBOutlet var view: UIView!
  
  init(frame: CGRect, presenter: MovieListPresenter) {
    self.presenter = presenter
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
