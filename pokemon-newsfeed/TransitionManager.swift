//
//  TransitionManager.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//


import UIKit

class MenuTransitionManager: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
  
  private var presenting = false
  private var interactive = false

  private var enterPanGesture: UIScreenEdgePanGestureRecognizer!
  
  var sourceViewController: UIViewController! {
    didSet {
      self.enterPanGesture = UIScreenEdgePanGestureRecognizer()
      self.enterPanGesture.addTarget(self, action: "handleOnstagePan:")
      self.enterPanGesture.edges = UIRectEdge.Left
      self.sourceViewController.view.addGestureRecognizer(self.enterPanGesture)
    }
  }
  
  func handleOnstagePan(pan: UIPanGestureRecognizer){
    let translation = pan.translationInView(pan.view!)
    let d =  translation.x / CGRectGetWidth(pan.view!.bounds) * 0.5
    
    switch (pan.state) {
      
    case UIGestureRecognizerState.Began:
      self.interactive = true
      self.sourceViewController.performSegueWithIdentifier("showSettingViewController", sender: self)
      break
      
    case UIGestureRecognizerState.Changed:
      self.updateInteractiveTransition(d)
      break
      
    default:
      self.interactive = false
      self.finishInteractiveTransition()
    }
  }

  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let container = transitionContext.containerView()
    let screens : (from: UIViewController, to: UIViewController) = (
      transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
      transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    )
    let menuViewController = !self.presenting ? screens.from as! SettingViewController : screens.to as! SettingViewController
    let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
    
    let menuView = menuViewController.view
    let bottomView = bottomViewController.view
    
    if (self.presenting){
      self.turnOffMenuController(menuViewController)
    }
    
    menuView.frame = bottomView.frame
    container!.addSubview(bottomView)
    container!.addSubview(menuView)
    
    let duration = self.transitionDuration(transitionContext)
   
    UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: [], animations: {
      
      if (self.presenting){
        self.turnOnMenuController(menuViewController)
        
      } else {
        self.turnOffMenuController(menuViewController)
      }
      
      }, completion: { finished in
        transitionContext.completeTransition(true)
        UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
        
    })
    
  }
  
  func offStage(amount: CGFloat) -> CGAffineTransform {
    return CGAffineTransformMakeTranslation(amount, 0)
  }
  
  func turnOffMenuController(menuViewController: SettingViewController){
    menuViewController.view.alpha = 0
    menuViewController.menuView.transform = offStage(-100)
  }
  
  func turnOnMenuController(menuViewController: SettingViewController){
    menuViewController.view.alpha = 1
    menuViewController.menuView.transform = CGAffineTransformIdentity
  }
  
  // return how many seconds the transiton animation will take
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 1
  }
  
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    self.presenting = true
    return self
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    presenting = false
    return self
  }
  
  func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return interactive ? self : nil
  }
  
  func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return interactive ? self : nil
  }
  
}

