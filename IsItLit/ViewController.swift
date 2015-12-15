//
//  ViewController.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/2/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit
import SwiftyButton
import MediaPlayer


class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func litButtonTapped(sender: AnyObject) {
     
    }

}


//YES NO VIEW CONTROLLER

class YesNoViewController : UIViewController {
    
    
    var litInfo : JSLogic.LitInfo!
    
    //OUTLETS
    @IBOutlet weak var backButton: SwiftyButton!
    @IBOutlet weak var litTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var litDescriptionTextView: UITextView!
    
    
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
            
            let gifImage = UIImage.animatedImageWithAnimatedGIFURL(url)
            
            self.view.backgroundColor = UIColor(patternImage: gifImage)

        }
        
       
        
       
        
        
    }
    
}
    



// DETAIL VIEW CONTROLLER

class DetailViewController : UIViewController {
   
    
    //OUTLETS
    @IBOutlet weak private var backButton: SwiftyButton!
    @IBOutlet weak private var questionButton: SwiftyButton!
    @IBOutlet weak private var detailTextView: UITextView!
    
    
    //VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        
    }
    
     func setUpView(){
        
        let yesOrNo = JSLogic.returnYesOrNo()
        
        if yesOrNo {
            
            self.questionButton.setTitle("...BUT HOW LIT IS IT?", forState: UIControlState.Normal)
            
//            self.view.backgroundColor = JSColors.yellow()

        }
            
        else{
            
            self.questionButton.setTitle("WAIT, IT'S NOT?", forState: UIControlState.Normal)
//            self.questionButton.setTitle("...BUT I WAS REALLY I HOPING IT WAS LIT?", forState: UIControlState.Normal)
            
//            self.view.backgroundColor = JSColors.blueDark()
            
            
        }
    }
    //ACTION
    @IBAction func questionButtonTapped(sender: AnyObject) {
        
        
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}