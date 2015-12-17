//
//  YesNoViewController.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/16/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit
import SwiftyButton
import MediaPlayer


class YesNoViewController : UIViewController {
    
    // MARK: Properties, Outlets and Actions
    var litInfo : LitInfo!
    var notificationCenter : NSNotificationCenter!
    
    @IBOutlet weak var backButton: SwiftyButton!
    @IBOutlet weak var litTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var litDescriptionTextView: UITextView!
    @IBOutlet weak var gifImageView: UIImageView!
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
        super.touchesEnded(touches, withEvent: event)
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView(){
        let returnedLitStatus   = JSGiphyAPIClient.getLitStatus()
        litInfo                 = returnedLitStatus
        
        if returnedLitStatus.litStatus == true{
            litTextField.text               = "IT'S LIT!"
            litDescriptionTextView.text     = returnedLitStatus.litString;
            backgroundView.backgroundColor  = UIColor.clearColor()
            self.view.backgroundColor       = UIColor.yellow()
            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus, viewController: self)
        }else{
            litTextField.text               = "NO."
            litDescriptionTextView.text     = returnedLitStatus.litString;
            backgroundView.backgroundColor  = UIColor.clearColor()
            self.view.backgroundColor       = UIColor.blueDark()
            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus, viewController: self)
        }
    }
    
    // MARK: GIF Loading
    func getGIFBackground(){
        
        if (litInfo.litGIFURL != nil){
            let url: NSURL = NSURL(string: litInfo.litGIFURL!)!
            self.gifImageView.sd_cancelCurrentImageLoad()
            self.gifImageView.sd_setImageWithURL(url, completed: nil)
            
            if self.litInfo.litStatus{
                backgroundView.backgroundColor = UIColor(white: 1.000, alpha: 0.10)
            }else{
                backgroundView.backgroundColor = UIColor(white: 0.000, alpha: 0.10)
            }
        }
    }
    
    
    
    
}

