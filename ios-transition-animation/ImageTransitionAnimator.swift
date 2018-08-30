//
//  ImageTransitionAnimator.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  var friendListName: UILabel?
  var friendListImage: UIImageView?

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.75
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

    guard let toFriendDetailVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
      let toView = transitionContext.view(forKey: .to) else { return }

    let containerView = transitionContext.containerView

    let toViewEndFrame = transitionContext.finalFrame(for: toFriendDetailVC)
    toView.frame = toViewEndFrame
    toView.alpha = 0.0
    containerView.addSubview(toView)

    let friendDetailName = toFriendDetailVC.friendName
    guard let friendDetailImage = toFriendDetailVC.friendImage else { return }

    guard let friendListNameLabel = friendListName,
      let friendDetailNameLabel = friendDetailName else { return }

    guard let friendListImage = friendListImage else { return }

    friendListNameLabel.alpha = 0.0
    friendDetailNameLabel.alpha = 0.0
    friendListImage.alpha = 0.0
    friendDetailImage.alpha = 0.0

    let labelFrame = containerView.convert(friendListNameLabel.bounds, from: friendListNameLabel)
    let animatedLabel = UILabel(frame: labelFrame)
    animatedLabel.text = friendListNameLabel.text
    containerView.addSubview(animatedLabel)

    let friendListImageFrame = containerView.convert(friendListImage.bounds, from: friendListImage)
    let friendDetailImageToAnimate = UIImageView(frame: friendListImageFrame)
    friendDetailImageToAnimate.image = friendListImage.image
    containerView.addSubview(friendDetailImageToAnimate)

    let duration = transitionDuration(using: transitionContext)

    toView.layoutIfNeeded()

    UIView.animate(withDuration: duration, animations: {
      animatedLabel.frame = containerView.convert(friendDetailNameLabel.bounds, from: friendDetailNameLabel)
      friendDetailImageToAnimate.frame = containerView.convert(friendDetailImage.bounds, from: friendDetailImage)

      toView.alpha = 1.0
    }) { (success) in
      friendDetailNameLabel.alpha = 1.0
      friendDetailImage.alpha = 1.0
      friendListNameLabel.alpha = 1.0
      friendListImage.alpha = 1.0
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
  }
}
