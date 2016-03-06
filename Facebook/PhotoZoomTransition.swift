//
//  PhotoZoomTransition.swift
//  Facebook
//
//  Created by Matthew Verghese on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoZoomTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {

        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController

        var newsViewFrame = containerView.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.scrollView)
        var photoViewFrame = containerView.convertRect(photoViewController.photoImage.frame, fromView: photoViewController.scrollView)

        let zoomImageView: UIImageView! = UIImageView()
        
        zoomImageView.frame = newsViewFrame
        zoomImageView.image = newsFeedViewController.selectedImageView.image
        zoomImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds
        zoomImageView.contentMode = newsFeedViewController.selectedImageView.contentMode
        containerView.addSubview(zoomImageView)

        photoViewController.photoImage.alpha = 0
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            
            toViewController.view.alpha = 1
            zoomImageView.frame = photoViewFrame
            
            
            }) { (finished: Bool) -> Void in
                
                zoomImageView.removeFromSuperview()
                photoViewController.photoImage.alpha = 1
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsFeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController

        var newsViewFrame = containerView.convertRect(newsFeedViewController.selectedImageView.frame, fromView: newsFeedViewController.scrollView)
        var photoViewFrame = containerView.convertRect(photoViewController.photoImage.frame, fromView: photoViewController.scrollView)

        let zoomImageView: UIImageView! = UIImageView()

        
        zoomImageView.frame = photoViewFrame
        zoomImageView.image = photoViewController.photoImage.image
        zoomImageView.clipsToBounds = photoViewController.photoImage.clipsToBounds
        zoomImageView.contentMode = photoViewController.photoImage.contentMode
        containerView.addSubview(zoomImageView)

        
        photoViewController.photoImage.alpha = 0
        newsFeedViewController.selectedImageView.alpha = 0
        fromViewController.view.alpha = 1
        
        
        UIView.animateWithDuration(duration, animations: {

            fromViewController.view.alpha = 0
            zoomImageView.frame = newsViewFrame
            zoomImageView.image = newsFeedViewController.selectedImageView.image
            zoomImageView.clipsToBounds = newsFeedViewController.selectedImageView.clipsToBounds

            
            }) { (finished: Bool) -> Void in

                newsFeedViewController.selectedImageView.alpha = 1
                zoomImageView.removeFromSuperview()
                self.finish()
        }
    }
    
}
