//
//  MovieListCellView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//



import UIKit
import Combine

class MovieListCellView: UITableViewCell, ReusableCellProtocol {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var poster: UIImageView!
  
  private var cancellables = Set<AnyCancellable>()
  internal var presenter: MovieListCellPresenter? {
    didSet {
      presenter?.objectWillChange
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: refresh)
        .store(in: &cancellables)
    }
  }
  
  private func refresh() {
    guard let presenter = presenter else { return }
    label.text = presenter.detail?.title
    poster.image = presenter.poster
  }
}
