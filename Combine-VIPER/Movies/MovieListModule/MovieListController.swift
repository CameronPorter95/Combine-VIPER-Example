//
//  ViewController.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import UIKit
import Combine

class MovieListController: UIViewController {
  private var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let view =
    MovieListView(presenter:
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
    
    NotificationCenter.default.publisher(for: .didCreateDetailView)
      .compactMap { $0.object as? MovieDetailView }
      .sink { [weak self] view in
        self?.navigateToDetail(with: view)
      }
      .store(in: &cancellables)
  }
  
  func navigateToDetail(with view: MovieDetailView) {
    let detailController = MovieDetailController()
    
    detailController.view.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.leftAnchor.constraint(equalTo: detailController.view.leftAnchor),
      view.rightAnchor.constraint(equalTo: detailController.view.rightAnchor),
      view.bottomAnchor.constraint(equalTo: detailController.view.bottomAnchor),
      view.topAnchor.constraint(equalTo: detailController.view.topAnchor)
    ])
    
    navigationController?.pushViewController(detailController, animated: true)
  }
}
