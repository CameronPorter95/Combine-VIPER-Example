//
//  MovieListCellView.swift
//  Combine-VIPER
//
//  Created by Cam on 10/12/21.
//

import Foundation
import UIKit

class MovieListCellView: UITableViewCell, CellProtocol {
  @IBOutlet weak var label: UILabel!
  
  func render(_ model: MovieListCellModel) {
    label.text = model.title
  }
}
