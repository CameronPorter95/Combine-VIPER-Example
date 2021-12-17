//
//  ViewController.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import UIKit
import Combine

class MovieListController: UIViewController {
  
  var movieListView: MovieListView? {
    view.subviews.first as? MovieListView
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    movieListView?.didDisappear()
  }
}
