//
//  ViewController.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/2/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit
import SwiftyButton

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
    
    //OUTLETS
    @IBOutlet weak var backButton: SwiftyButton!
    @IBOutlet weak var litTextField: UITextField!
    @IBOutlet weak var litImageVIew: UIImageView!
    @IBOutlet weak var moreDetailButton: SwiftyButton!
    
    
    //ACTIONS
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func moreDetailButtonTapped(sender: AnyObject) {
        
        
    }
    
    
    //VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        let yesOrNo = JSLogic.returnYesOrNo()
        
        if yesOrNo {
            
            
        }
        
        else{
            
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
        
    }
    
     func setUpView(){
        
        let yesOrNo = JSLogic.returnYesOrNo()
        
        if yesOrNo {
            
            backButton.setTitle("...BUT HOW LIT IS IT?", forState: UIControlState.Normal)

        }
            
        else{
            
            backButton.setTitle("...BUT I WAS REALLY I HOPING IT WAS LIT?", forState: UIControlState.Normal)
            
            self.view.backgroundColor = UI()
        }
    }
    //ACTION
    @IBAction func questionButtonTapped(sender: AnyObject) {
        
        
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        
    }
}