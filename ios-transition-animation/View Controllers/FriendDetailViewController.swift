//
//  FriendDetailViewController.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    transitioningDelegate = self
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return imageTransitionAnimator
  }
  
  let imageTransitionAnimator = ImageTransitionAnimator()
  @IBOutlet var friendName: UILabel!
  @IBOutlet var friendImage: UIImageView!
}
