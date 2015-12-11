//
//  JSLogic.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/2/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit


class JSLogic: NSObject {
    

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
    

    class func returnLitStatus() -> (LitInfo){
        
        let  responseDictionaries = buildResponseArrays()
        
        let noResponse  = responseDictionaries[0] as Array
        let yesResponse = responseDictionaries[1] as Array
        
        
        if returnYesOrNo() {
            
            let responseRandomizer  = Int(arc4random_uniform(UInt32(yesResponse.count)))
            
            let litResponse         = LitInfo(  litStatus: true,
                                                litString: yesResponse[responseRandomizer],
                                                litGIFURL: "")
            
            return litResponse
            
        }else{
            
            let responseRandomizer  = Int(arc4random_uniform(UInt32(noResponse.count)))
            let litResponse         = LitInfo(  litStatus: false,
                                                litString: noResponse[responseRandomizer],
                                                litGIFURL: "")
            return litResponse

        }
        
    }

    
    class func returnYesOrNo () -> (Bool){
        
        let responseRandomizer = Int(arc4random_uniform(UInt32(10)))
        
        if responseRandomizer > 5 {
            return true
        }else{
            return false
        }
            
        
    }
    
    
    struct LitInfo {
        
        var litStatus   : Bool
        var litString   : String
        var litGIFURL   : String?
    }
}

/*

yes or no

if yes, set it as yes and grab url
    
    want to go before url comes back
        -they can go, the view will read the struct and make it
        -when you get to the second view, just ask for the view and refresh when you get it

    want to go after the URL comes back
        -when they load the view, 


*/


