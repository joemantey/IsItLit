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
    class func buildResponseArrays () -> (Array <Array<String>>){
        
        let noResponse = [  "It's like someone died in here.",
                            "Not even close.",
                            "Kinda surprised you couldn't tell...",
                            "Just, no.",
                            "I have made my ruling.",
                            "And it's better this way.",
                            "Oof, sorry.",
                            "Try again later.",
                            "Wish I had better news for you.",
                            "It'll be lit soon though. Just wait on it.",
                            "It's almost lit though.",
                            "You're sweating it, so no.",
                            "You aren't ready.",
                            "Better luck next time.",
                            "You didn't want it enough.",
                            "You can't always get what you want."]
        
        
//        ["Kidding, it's totally it's lit!",
//                            "Yeah, I was wishing it was lit too",
//                            "You can't always get what you want",
//                            "I call it how I see it",
//                            "Yeah, but trust it's me it's better this way",
//                            "Ask me again",
//                            "You know it wasn't lit, that's why you asked",
//                            "I have made my ruling",
//                            "You and me both",
//                            "I know, huh?",
//                            "Maybe when you are older",
//                            "Worry not, there is lit in you future",
//                            "Ok, ok, it's lit. Now what?",
//                            "If I told you it was lit, would you believe me?",
//                            "Sometimes you gotta make lit happen for yourself",
//                            "The sooner you except it's not lit, the better.",
//                            "Yeah, it's gonna be a no for me dawg.",
//                            "Sorry not sory"]
        
        
        let yesResponse =  ["Oh, it's f@#ck!ng lit!",
                            "It's dumb lit!",
                            "It's mad lit!",
                            "Barely.",
                            "I mean, we out here...",
                            "Look at your battery meter. That's how lit it is.",
                            "Folks wanna pop off?!",
                            "You've got genuine a lituation on your hands!",
                            "Stop what you are doing and party!",
                            "Are you not entertained?!",
                            "Litness was inside of you the entire time.",
                            "Lit like Bic.",
                            "Pipe it up!",
                            "As good a time as any to dab on em!",
                            "Go get your destiny!",
                            "Lowkey like tyring a Patti Pie for the first time!"]
            
        
        let responseArrayArray = [noResponse, yesResponse]
        
        
        return responseArrayArray
        
    }
    
    //RETURN LIT STATUS
    class func returnLitStatus() -> (responseString: String, yesOrNo: Bool){
        
        let  responseDictionaries = buildResponseArrays()
        
        let noResponse  = responseDictionaries[0] as Array
        let yesResponse = responseDictionaries[1] as Array
        
        
        if returnYesOrNo() {
            
            let responseRandomizer = Int(arc4random_uniform(UInt32(yesResponse.count)))
            return (yesResponse[responseRandomizer], true)
            
        }else{
            
            let responseRandomizer = Int(arc4random_uniform(UInt32(noResponse.count)))
            return (noResponse[responseRandomizer], false)

        }
        
    }
    
    //RETURN YES OR NO
    class func returnYesOrNo () -> (Bool){
        
        let responseRandomizer = Int(arc4random_uniform(UInt32(10)))
        
        if responseRandomizer > 5 {
            return true
        }else{
            return false
        }
            
        
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
    
    //RED
     class func redWhite()->UIColor{
        
        return UIColor(red: 254, green: 220, blue: 222)
    }
    
     class func redMedium()->UIColor{
        
        return UIColor(red: 204, green: 51, blue: 51)
    }
    
     class func redDark()->UIColor{
        
        return UIColor(red: 153, green: 51, blue: 51)
    }
    
    
    
    //BLUE
    public class func blueWhite()->UIColor{
        
        return UIColor(red: 215, green: 227, blue: 255)
    }
    
    public class func blueLight()->UIColor{
        
        return UIColor(red: 39, green: 78, blue: 193)
    }
    
    public class func blueMedium()->UIColor{
        
        return UIColor(red: 38, green: 64, blue: 134)
    }
    
    public class func blueDark()->UIColor{
        
        return UIColor(red: 15, green: 19, blue: 28)
    }
    
    
    //OTHER
    public class func yellow()->UIColor{
        
        return UIColor(red: 255, green: 204, blue: 51)
    }
    
    public class func lightOrange()->UIColor{
        
        return UIColor(red: 255, green: 51, blue: 0)
    }
    
    public class func darkOrange()->UIColor{
        
        return UIColor(red: 134, green: 29, blue: 15)
    }
    
    
}

//class JSColors : UIColor {
//    
//    //RED
//    static func redWhite()->UIColor{
//        
//        return UIColor(red: 254, green: 220, blue: 222, alpha: 1)
//    }
//    
//    static func redMedium()->UIColor{
//        
//        return UIColor(red: 204, green: 51, blue: 51, alpha: 1)
//    }
//    
//    static func redDark()->UIColor{
//        
//        return UIColor(red: 153, green: 51, blue: 51, alpha: 1)
//    }
//    
//
//    
//    //BLUE
//    static func blueWhite()->UIColor{
//        
//        return UIColor(red: 215, green: 227, blue: 255, alpha: 1)
//    }
//    
//    static func blueLight()->UIColor{
//        
//        return UIColor(red: 39, green: 78, blue: 193, alpha: 1)
//    }
//    
//    static func blueMedium()->UIColor{
//        
//        return UIColor(red: 38, green: 64, blue: 134, alpha: 1)
//    }
//    
//    static func blueDark()->UIColor{
//        
//        return UIColor(red: 24, green: 33, blue: 49, alpha: 1)
//    }
//    
//    
//    //OTHER
//    static func yellow()->UIColor{
//        
//        return UIColor(red: 255, green: 204, blue: 51, alpha: 1)
//    }
//    
//    static func lightOrange()->UIColor{
//        
//        return UIColor(red: 255, green: 51, blue: 0, alpha: 1)
//    }
//    
//    static func darkOrange()->UIColor{
//        
//        return UIColor(red: 134, green: 29, blue: 15, alpha: 1)
//    }
//    
//
//
//}





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
