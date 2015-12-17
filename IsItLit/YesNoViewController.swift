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
    
    
    var litInfo : LitInfo!
    var notificationCenter : NSNotificationCenter!
    
    //OUTLETS
    @IBOutlet weak var backButton: SwiftyButton!
    @IBOutlet weak var litTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var litDescriptionTextView: UITextView!
    @IBOutlet weak var gifImageView: UIImageView!
    
    
    //ACTIONS
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        self.notificationCenter = NSNotificationCenter.defaultCenter()
//        self.notificationCenter.addObserver(self, selector: "getGIFBackground", name: "GIFisHere", object: nil)
//        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        self.notificationCenter.removeObserver(self)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        setUpView()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
        super.touchesEnded(touches, withEvent: event)
    }
    
    func setUpView(){
        
        let returnedLitStatus = JSGiphyAPIClient.getLitStatus()
        litInfo = returnedLitStatus
        
        if returnedLitStatus.litStatus == true{
            
            litTextField.text               = "IT'S LIT!"
            litDescriptionTextView.text     = returnedLitStatus.litString;
            
            backgroundView.backgroundColor  = UIColor.clearColor()
            self.view.backgroundColor       = UIColor.yellow()
            
            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus, viewController: self)
        }
            
        else{
            
            litTextField.text               = "NO."
            litDescriptionTextView.text     = returnedLitStatus.litString;
            backgroundView.backgroundColor  = UIColor.clearColor()
            self.view.backgroundColor       = UIColor.blueDark()

            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus, viewController: self)
        }
    }
    
    
    
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

