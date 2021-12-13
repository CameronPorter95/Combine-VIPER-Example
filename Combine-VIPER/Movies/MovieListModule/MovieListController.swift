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
    
    let view =
    MovieListView(frame: view.frame, presenter:
      MovieListPresenter(interactor:
        MovieListInteractor(model: MovieListModel(), provider:
          MovieListProvider(repository:
            MovieListRepository(persistence: appDelegate.persistence)
          )
        )
      )
    )
    
    self.view.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      view.topAnchor.constraint(equalTo: self.view.topAnchor)
    ])
  }
}
