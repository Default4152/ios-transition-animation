//
//  NavigationControllerDelegate.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    let imageTransitionAnimator = ImageTransitionAnimator()
    imageTransitionAnimator.friendListName = sourceCell?.textLabel
    imageTransitionAnimator.friendListImage = sourceCell?.imageView

    if operation == .push {
      imageTransitionAnimator.isPush = true
      return imageTransitionAnimator
    } else {
      imageTransitionAnimator.isPush = false
      return imageTransitionAnimator
    }

  }
  
  var sourceCell: UITableViewCell?
}
