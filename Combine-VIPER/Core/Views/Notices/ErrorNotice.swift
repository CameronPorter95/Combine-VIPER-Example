//
//  BannerNotice.swift
//  OrbitRemit
//
//  Created by Cam on 5/02/21.
//  Copyright © 2021 OrbitRemit. All rights reserved.
//

import Foundation
import UIKit

class ErrorNotice: NoticeView {
  func setup(using notice: Notice) {
    titleLabel.text = notice.title
    
    let height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    heightAnchor.constraint(equalToConstant: height).isActive = true
  }
}
