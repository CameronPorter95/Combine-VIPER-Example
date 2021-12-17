//
//  MovieListCellView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//



import UIKit
import Combine

class MovieListCellView: UITableViewCell, CellProtocol {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var poster: UIImageView!
  
  func render(_ model: MovieListCellModel) {
    label.text = model.detail.title
    poster.image = model.poster
    poster.layer.cornerRadius = poster.bounds.width / 2
  }
}
