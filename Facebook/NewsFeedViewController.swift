//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    var photoZoomTransition: PhotoZoomTransition!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet var containerView: UIView!
    
    var selectedImageView: UIImageView!

    var window: UIWindow!
    var zoomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        window = UIApplication.sharedApplication().keyWindow

        photoZoomTransition = PhotoZoomTransition()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    
    @IBAction func onTapGesturePhoto(sender: UITapGestureRecognizer) {

        // Get the image that was tapped on
        selectedImageView = sender.view as! UIImageView
        self.performSegueWithIdentifier("expandPhotoSegue", sender: self)
        
    }
    
    @IBAction func onTestButtonTap(sender: AnyObject) {
        

        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.view.layoutIfNeeded()
        destinationViewController.photoImage.image = selectedImageView.image
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = photoZoomTransition
        
        
        

    }

    
    
    
}
