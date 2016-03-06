//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Matthew Verghese on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var doneButtonImage: UIImageView!
    @IBOutlet weak var photoActionsImage: UIImageView!
    @IBOutlet var contentView: UIView!
    
    var photoImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(320, 600)
        scrollView.delegate = self
        
        contentView.backgroundColor = UIColor(white:0, alpha: 1)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        var alpha = convertValue(abs(scrollView.contentOffset.y), r1Min: 0, r1Max: 400, r2Min: 1, r2Max: 0.5)
        contentView.backgroundColor = UIColor(white: 0, alpha: alpha)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("begin drag")

        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in

            self.doneButtonImage.alpha = 0
            self.photoActionsImage.alpha = 0

            }) { (Bool) -> Void in

        }

        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger

            if abs(scrollView.contentOffset.y) > 100 {
                
                dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                    
                    self.doneButtonImage.alpha = 1
                    self.photoActionsImage.alpha = 1
                    
                    }) { (Bool) -> Void in
                        
                }
                
            }

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return photoImage

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
