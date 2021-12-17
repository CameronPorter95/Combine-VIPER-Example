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
  @IBOutlet weak var genreStack: UIStackView!
  @IBOutlet weak var overview: UILabel!
  
  override var bounds: CGRect {
    didSet {
      refreshGenres()
    }
  }
  
  required init(presenter: MovieDetailPresenter) {
    super.init(presenter: presenter)
    poster.layer.shadowPath = UIBezierPath(rect: poster.bounds).cgPath
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func refresh(output: Void) {
    super.refresh(output: output)
    titleLabel.text = presenter.detail?.title
    poster.image = presenter.poster
    overview.text = presenter.detail?.overview
    refreshGenres()
  }
  
  func refreshGenres() {
    genreStack.subviews.forEach {
      genreStack.removeArrangedSubview($0)
      $0.removeFromSuperview()
    }
    if let genres = presenter.detail?.genres {
      let stack = UIStackView(arrangedSubviews: [])
      stack.axis = .horizontal
      stack.spacing = 6
      genreStack.addArrangedSubview(stack)
      for genre in genres {
        let label = UILabel()
        label.text = "  \(genre.name)  "
        label.textColor = .secondaryLabel
        label.backgroundColor = .secondarySystemFill
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.layer.cornerRadius = 7
        label.layer.masksToBounds = true
        
        let currentWidth = (genreStack.arrangedSubviews.last! as! UIStackView).arrangedSubviews.reduce(into: 0, { accum, next in
          accum += next.intrinsicContentSize.width + 6
        })
        
        if (poster.frame.minX - 40) - currentWidth > label.intrinsicContentSize.width {
          (genreStack.arrangedSubviews.last! as! UIStackView).addArrangedSubview(label)
        } else {
          let stack = UIStackView(arrangedSubviews: [])
          stack.axis = .horizontal
          stack.spacing = 6
          stack.addArrangedSubview(label)
          genreStack.addArrangedSubview(stack)
        }
      }
    }
  }
}
