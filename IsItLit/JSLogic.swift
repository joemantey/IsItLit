//
//  JSLogic.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/2/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit

class JSLogic: NSObject {
    
    //BUILD RESPONSE DICTIONARIES
    class func buildResponseDictionaries () -> (Array <Array<String>>){
        
        let noResponse =   ["Then boom, it's lit!",
                            "Here's proof 'hope' does work. It's lit!",
                            "Yeah, I was wishing it was lit too",
                            "You can't always get what you want",
                            "I call it how I see it",
                            "Yeah, but trust it's me it's better this way",
                            "Ask me again",
                            "You know it wasn't lit, that's why you asked",
                            "I have made my ruling",
                            "You and me both",
                            "I know, huh?",
                            "Maybe when you are older",
                            "Worry not, there is lit in you future",
                            "Ok, ok, it's lit. Now what?",
                            "If I told you it was lit, would you believe me?",
                            "Sometimes you gotta make lit happen for yourself",
                            "The sooner you except it's not lit, the better.",
                            "Yeah, it's gonna be a no for me dawg."]
        
        
        let yesResponse =  ["Oh it's f@#ck!ng lit",
                            "It's dumb lit",
                            "Never seen it this lit before",
                            "It's pretty lit",
                            "I've seen lit-er",
                            "Look, all I can tell you right now is that it's lit",
                            "I told you what it was and now you are asking more questions",
                            "Nevermind, you ruined it. It's not lit",
                            "Barely.",
                            "I mean, we out here...",
                            "Look at your battery meter. That's how lit it is.",
                            "Hey, just go with it, OK?",
                            "Folks wanna pop off"]
            
        
        let responseArrayArray = [noResponse, yesResponse]
        
        
        return responseArrayArray
        
    }
    
    //RETURN LIT STATUS
    class func returnLitStatus (yesOrNo:Bool) -> (String){
        
        let  responseDictionaries = buildResponseDictionaries()
        
        let noResponse  = responseDictionaries[0] as Array
        let yesResponse = responseDictionaries[1] as Array
        
        
        if yesOrNo {
            
            let responseRandomizer = Int(arc4random_uniform(UInt32(yesResponse.count)))
            return yesResponse[responseRandomizer]
            
        }else{
            
            let responseRandomizer = Int(arc4random_uniform(UInt32(noResponse.count)))
            return noResponse[responseRandomizer]

        }
        
    }
    
    //RETURN YES OR NO
    class func returnYesOrNo () -> (Bool){
        
        let responseRandomizer = Int(arc4random_uniform(UInt32(1)))
        return responseRandomizer.toBool()!
        
    }
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    // HEX      let fancySwiftColor = UIColor(red: 0xFF, green: 0xA5, blue: 0)
    
}

class JSColors : UIColor {
    
    let newSwiftColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

}





extension Int {
    
    func toBool () ->Bool? {
        
        switch self {
            
        case 0:
            return false
            
        case 1:
            return true
            
        default:
            return nil
        }
        
    }
}
