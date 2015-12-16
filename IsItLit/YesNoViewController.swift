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
    
    
    var litInfo : JSLogic.LitInfo!
    
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
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "getGIFBackground", name: "GIFisHere", object: nil)
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        setUpView()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func setUpView(){
        
        let returnedLitStatus = JSLogic.returnLitStatus()
        litInfo = returnedLitStatus
        
        if returnedLitStatus.litStatus == true{
            
            litTextField.text               = "IT'S LIT!"
            litDescriptionTextView.text     = returnedLitStatus.litString;
            
            backgroundView.backgroundColor  = UIColor.yellow()
            
            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus)
        }
            
        else{
            
            litTextField.text               = "NO."
            litDescriptionTextView.text     = returnedLitStatus.litString;
            backgroundView.backgroundColor  = UIColor.blueDark()
            
            JSGiphyAPIClient().getGif(returnedLitStatus.litStatus)
            
            
            
        }
    }
    
    func getGIFBackground(){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let gifURLString = defaults.stringForKey("string") {
            
            let url: NSURL = NSURL(string: gifURLString)!
            
            
            backgroundView.backgroundColor = UIColor(white: 0.000, alpha: 0.10)
            
            
            self.gifImageView.sd_setImageWithURL(url, completed: nil)
            
        }
        
        
        
        
        
        
    }
    
}

