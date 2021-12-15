//
//  MovieDetailView.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import UIKit
import Combine

class MovieDetailView: MainView<MovieDetailPresenter> {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var poster: UIImageView!
  
  required init(presenter: MovieDetailPresenter) {
    super.init(presenter: presenter)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func refresh(output: Void) {
    super.refresh(output: output)
    titleLabel.text = presenter.detail?.title
    poster.image = presenter.poster
  }
}
