//
//  SplitController.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 14/12/21.
//

import Foundation
import Combine
import UIKit

class MovieSplitController: UISplitViewController {
  private var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let listView =
    MovieListView(presenter:
      MovieListPresenter(interactor:
        MovieListInteractor(model: MovieListModel(), provider:
          MovieListProvider(repository:
            MovieListRepository(persistence: appDelegate.persistence)
          )
        )
      )
    )
    
    let detailView = MovieDetailView(presenter:
      MovieDetailPresenter(interactor:
        MovieDetailInteractor(model: MovieDetailModel(), provider:
          MovieDetailProvider(repository:
            MovieDetailRepository(persistence: appDelegate.persistence)
          )
        )
      )
    )
    
    let listController = MovieListController()
    let detailController = MovieDetailController()
    
    constrain(view: listView, to: listController)
    constrain(view: detailView, to: detailController)
    
    viewControllers = [listController, detailController]
    
    setViewController(listController, for: .primary)
    setViewController(detailController, for: .secondary)
    
    NotificationCenter.default.publisher(for: .didSelectMovie, object: nil)
      .sink { [weak self] _ in
        self?.showDetailViewController(detailController, sender: nil)
      }
      .store(in: &cancellables)
  }
  
  func constrain(view: UIView, to controller: UIViewController) {
    controller.view.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.leftAnchor.constraint(equalTo: controller.view.leftAnchor),
      view.rightAnchor.constraint(equalTo: controller.view.rightAnchor),
      view.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
      view.topAnchor.constraint(equalTo: controller.view.topAnchor)
    ])
  }
}

extension MovieSplitController: UISplitViewControllerDelegate {
  func splitViewController(_ svc: UISplitViewController,
                           topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column)
  -> UISplitViewController.Column {
    .primary
  }
}
