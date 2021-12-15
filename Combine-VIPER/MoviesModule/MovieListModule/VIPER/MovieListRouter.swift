//
//  MovieListRouter.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListRouter {
  func makeMovieCellModule(for cell: MovieListCellView, with model: MovieListCellModel) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    cell.presenter = MovieListCellPresenter(interactor:
      MovieListCellInteractor(
        model: model,
        provider: MovieListCellProvider(repository:
          MovieImageRepository(persistence: appDelegate.persistence)
        )
      )
    )
  }
}
