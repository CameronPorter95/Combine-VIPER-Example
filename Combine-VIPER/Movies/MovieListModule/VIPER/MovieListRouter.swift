//
//  MovieListRouter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListRouter {
  func makeDetailView(for id: Int) -> MovieDetailView {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let view = MovieDetailView(presenter:
      MovieDetailPresenter(interactor:
        MovieDetailInteractor(model: MovieDetailModel(id: id), provider:
          MovieDetailProvider(repository:
            MovieDetailRepository(persistence: appDelegate.persistence)
          )
        )
      )
    )
    NotificationCenter.default.post(name: .didCreateDetailView, object: view)
    return view
  }
}

extension Notification.Name {
  static let didCreateDetailView = Notification.Name(rawValue: "didCreateDetailView")
}
