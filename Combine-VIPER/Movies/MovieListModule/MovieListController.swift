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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let repository = MovieListRepository(persistence: appDelegate.persistence)
    let provider = MovieListProvider(repository: repository)
    let model = MovieListModel()
    let interactor = MovieListInteractor(model: model, provider: provider)
    let presenter = MovieListPresenter(interactor: interactor)
    let view = MovieListView(frame: view.frame, presenter: presenter)
    self.view = view
  }
}
