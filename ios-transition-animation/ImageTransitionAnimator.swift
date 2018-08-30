//
//  ImageTransitionAnimator.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromFriendListVC = transitionContext.viewController(forKey: .from) as? FriendListTableViewController,
      let toFriendDetailVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
      let toView = transitionContext.view(forKey: .to) else { return }
    
    let friendListImage = fromFriendListVC.tableView.cellForRow(at: [0])?.imageView
    let friendListName = fromFriendListVC.tableView.cellForRow(at: [0])?.detailTextLabel?.text
    let friendDetailName = toFriendDetailVC.friendName
    let friendDetailImage = toFriendDetailVC.friendImage
  }
}
