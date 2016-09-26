//
//  Extentions.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomIn(duration duration: NSTimeInterval = 0.2) {
        self.transform = CGAffineTransformMakeScale(0.0, 0.0)
        UIView.animateWithDuration(duration, delay: 0.0, options: [.CurveLinear], animations: { () -> Void in
            self.transform = CGAffineTransformIdentity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration duration: NSTimeInterval = 0.2) {
        self.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(duration, delay: 0.0, options: [.CurveLinear], animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(0.0, 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration duration: NSTimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = NSTimeInterval(easingOffset) * duration / NSTimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animateWithDuration(scalingDuration, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(easeScale, easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animateWithDuration(easingDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                    self.transform = CGAffineTransformIdentity
                    }, completion: { (completed: Bool) -> Void in
                })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration duration: NSTimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = NSTimeInterval(easingOffset) * duration / NSTimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animateWithDuration(easingDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(easeScale, easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animateWithDuration(scalingDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                    self.transform = CGAffineTransformMakeScale(0.0, 0.0)
                    }, completion: { (completed: Bool) -> Void in
                })
        })
    }
    
}

extension UIViewController{
    func pushViewControllerWithAnimation(viewController : UIViewController){
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            self.navigationController!.pushViewController(viewController, animated: false)
            UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: self.navigationController!.view!, cache: false)
        })
    }
    
    func popWithAnimation(){
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(UIViewAnimationTransition.CurlDown, forView: self.navigationController!.view, cache: false)
        })
    }
}