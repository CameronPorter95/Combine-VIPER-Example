//
//  MovieListView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit
import Combine

class MovieListView: MainView<MovieListPresenter> {
  @IBOutlet var tableView: UITableView!
  
  required init(presenter: MovieListPresenter) {
    super.init(presenter: presenter)
    
    let cell = UINib(nibName: String(describing: MovieListCellView.self), bundle: nil)
    tableView.register(cell, forCellReuseIdentifier: MovieListCellView.reuseIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func refresh(output: Void) {
    super.refresh(output: output)
    tableView.reloadData()
  }
}

extension MovieListView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cellModel = presenter.movies[safe: indexPath.row] {
      presenter.notifyMovieSelection(with: cellModel)
    }
  }
}

extension MovieListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCellView.reuseIdentifier, for: indexPath) as! MovieListCellView
    cell.render(presenter.movies[indexPath.row])
//    if presenter.movies[indexPath.row].isAssignedToModule == false {
//      presenter.router.makeMovieCellModule(for: cell, with: presenter.movies[indexPath.row])
//    } else {
//      cell.presenter?.detail = presenter.movies[indexPath.row].detail
//      cell.presenter?.poster = presenter.movies[indexPath.row].poster
//      cell.presenter?.interactor.model.poster = presenter.movies[indexPath.row].poster
//      cell.presenter?.interactor.model.detail = presenter.movies[indexPath.row].detail
////      cell.presenter?.interactor.setModel(to: presenter.movies[indexPath.row]) //Because the cell is reused, the model needs to be reused too
//    }
//    cell.poster.image = presenter.movies[indexPath.row].poster
//    cell.label.text = presenter.movies[indexPath.row].detail.title
    return cell
  }
}
