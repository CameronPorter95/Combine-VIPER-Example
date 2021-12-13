//
//  ErrorView.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import UIKit

typealias NoticeView = NoticeViewBase & NoticeViewProtocol
typealias NoticeViewPresentation = (transition: NoticeViewTransitionType, position: NoticeViewPositionType)

protocol NoticeViewProtocol {
  func setup(using notice: Notice)
}

enum NoticeViewType {
  case error(NoticeViewPresentation = (.pan, .bottom(-55)))
  
  var instance: NoticeView {
    switch self {
    case .error:
      return ErrorNotice()
    }
  }
  
  var value: NoticeViewPresentation {
    switch self {
    case .error(let value):
      return value
    }
  }
  
  ///The distance either above or below the notice
  var margin: CGFloat? {
    switch value.position {
    case .bottom(let value):
      return value
    }
  }
}

enum NoticeViewTransitionType {
  case pan
}

enum NoticeViewPositionType {
  case bottom(CGFloat)
}

class NoticeViewBase: UIView, NibType {
  @IBOutlet var view: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  static var parent: UIView!
  static var visualEffectsView: UIVisualEffectView?
  var notice: Notice?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }

  private func sharedInit() {
    nibInit()
  }
  
  static func show(onto view: UIView? = nil, using notice: Notice) {
    guard let view = view ?? parent else { return }
    parent = view
    
    switch notice.type.value.transition {
    case .pan:
      presentPanNoticeView(using: notice)
    }
  }
  
  private static func createNoticeView(using notice: Notice) -> NoticeView {
    let noticeView = notice.type.instance
    let position = notice.type.value.position
    
    noticeView.setup(using: notice)
    constrain(noticeView: noticeView, to: position, on: parent)
    
    noticeView.notice = notice
    return noticeView
  }
  
  ///Present a notice with pan
  @discardableResult private static func presentPanNoticeView(using notice: Notice) -> NoticeView? {
    let noticeView = createNoticeView(using: notice)
    
    let margin = notice.type.margin ?? 0
    noticeView.transform = CGAffineTransform(translationX: 0, y: noticeView.bounds.height - margin)
    
    UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
      noticeView.transform = .identity
    })
    return noticeView
  }
  
  private static func constrain(noticeView: NoticeView, to position: NoticeViewPositionType, on parent: UIView) {
    noticeView.translatesAutoresizingMaskIntoConstraints = false
    parent.addSubview(noticeView)
    parent.bringSubviewToFront(noticeView)
    switch position {
    case .bottom(let value):
      noticeView.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: 20).isActive = true
      noticeView.rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -20).isActive = true
      noticeView.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: value).isActive = true
    }
    parent.layoutIfNeeded()
  }
  
  func hide() {
    guard let notice = notice else { return }
    
    if let next = notice.nextNotice {
      //If there is another notice to show, then dismiss this one depending on its type, and show the next depending on the nexts type
      switch notice.type.value.transition {
      case .pan:
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
          let margin = notice.type.margin ?? 0
          let inset = self.superview?.safeAreaInsets.bottom ?? 0
          self.transform = CGAffineTransform(translationX: 0, y: self.bounds.height + inset - margin)
        }, completion: { _ in
          self.removeFromSuperview()
          NoticeViewBase.show(using: next)
        })
      }
    }
    else { //No more notices to show, remove current notice
      remove()
    }
  }
  
  func remove() {
    guard let notice = notice else { return }
    
    switch notice.type.value.transition {
    case .pan:
      UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
        let margin = notice.type.margin ?? 0
        let inset = self.superview?.safeAreaInsets.bottom ?? 0
        self.transform = CGAffineTransform(translationX: 0, y: self.bounds.height + inset - margin)
      }, completion: { _ in
        self.removeFromSuperview()
      })
    }
    
    NoticeViewBase.parent = nil
  }
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    if window == nil {
      if NoticeViewBase.parent?.window == nil {
        remove() //If the parent was dismissed then remove notices
      } else {
        hide() //If notice was removed but parent is still shown then call hide to trigger the next notice
      }
    }
  }
  
  @objc func rotated() {
    hide()
  }
  
  @IBAction func closePressed(_ sender: Any) {
    hide()
  }
  
  @IBAction func submitPressed(_ sender: Any) {
    hide()
  }
}
