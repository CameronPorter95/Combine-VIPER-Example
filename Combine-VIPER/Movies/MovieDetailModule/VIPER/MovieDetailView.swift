//
//  MovieDetailView.swift
//  Combine-VIPER
//
//  Created by Cam on 14/12/21.
//

import Foundation
import UIKit
import Combine

class MovieDetailView: View<MovieDetailPresenter> {
  @IBOutlet weak var titleLabel: UILabel!
  
  required init(presenter: MovieDetailPresenter) {
    super.init(presenter: presenter)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func refresh(output: Void) {
    super.refresh(output: output)
    print(presenter.detail?.title)
    titleLabel.text = presenter.detail?.title
  }
}
