//
//  MovieListView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit
import Combine

class MovieListView: View<MovieListPresenter> {
  @IBOutlet var tableView: UITableView!
  
  required init(frame: CGRect, presenter: MovieListPresenter) {
    super.init(frame: frame, presenter: presenter)
    
    let cell = UINib(nibName: String(describing: MovieListCellView.self), bundle: nil)
    tableView.register(cell, forCellReuseIdentifier: MovieListCellView.reuseIdentifier)
    tableView.dataSource = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func refresh(output: Void) {
    presenter.errors.forEach {
      print($0)
    }
    
    tableView.reloadData()
  }
}

extension MovieListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCellView", for: indexPath) as! MovieListCellView
    cell.render(presenter.movies[indexPath.row])
    return cell
  }
}
