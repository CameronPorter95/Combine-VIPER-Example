//
//  ViewController.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import UIKit

class MovieListController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let factory = ProviderModuleFactory<MovieListRepository, MovieListProvider,
                                        MovieListModel, MovieListInteractor,
                                        MovieListPresenter, MovieListView>()
    self.view = factory.createModule(for: self.view.frame)
  }
}
