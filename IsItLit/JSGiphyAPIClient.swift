//
//  JSGiphyAPIClient.swift
//  IsItLit
//
//  Created by Norma Smalls-Mantey on 12/11/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


struct StoredGIFURL {
    
    static var string = ""
}


struct LitInfo {
    
    var litStatus   : Bool
    var litString   : String
    var litGIFURL   : String?
}


class JSGiphyAPIClient: NSObject {
    
    class func getLitStatus() -> (LitInfo){
        
        let noResponse  = SearchArrays().noResponse
        let yesResponse = SearchArrays().yesResponse
        
        if JSLogic.returnYesOrNo() {
            
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

    
    func getGif(type: Bool){
        
        var searchString = ""
        
        switch type{
            case true:
                searchString = getSearchTerms(type)
            case false:
                searchString = getSearchTerms(type)
        }
        
        let baseURL     = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag="
        let searchURL   = baseURL + searchString
        
        Alamofire.request(.GET, searchURL).validate().responseJSON { response in
            switch response.result {
                
            case .Success:
                if let value = response.result.value {
                
                    let json                = JSON(value)
                    let gifURL              = json["data","image_original_url"].string
                    if  (gifURL != nil) {
                        StoredGIFURL.string = gifURL!
                        
                    }
                    
                    let notificationCenter  = NSNotificationCenter.defaultCenter()
                    notificationCenter.postNotificationName("GIFisHere", object: nil)
            }
                
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func getSearchTerms(type: Bool) -> (String){
        
        var searchTermArray = []
        
        if type {
            
            searchTermArray = SearchArrays().yesSearchTerms
        }else{
            
            searchTermArray = SearchArrays().noSearchTerns
        }
        
        
        let responseRandomizer  = Int(arc4random_uniform(UInt32(searchTermArray.count)))
        let returnString        = searchTermArray[responseRandomizer]
        
        return returnString as! (String)
    }
    
}


struct SearchArrays {
    
    let yesSearchTerms  = [ "happy",
                            "excited",
                            "win",
                            "ftw",
                            "celebrate",
                            "celebration",
                            "score",
                            "yes",
                            "vicotry",
                            "yas",
                            "happy dance"]
    
    let noSearchTerns   = [ "fail",
                            "epicfail",
                            "no",
                            "falling",
                            "fall",
                            "oops",
                            "ouch",
                            "nope"]
    
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
        "You can't always get what you want.",
        "It's actually kinda offputting how not lit it is",
        "It's like you're not even trying",
        "Did you put in in rice?"]
    
    
    let yesResponse =  ["Oh, it's f@#ck!ng lit!",
        "It's dumb lit!",
        "It's mad lit!",
        "Barely.",
        "I mean, we out here...",
        "Look at your battery meter. That's how lit it is.",
        "Folks wanna pop off!",
        "You've got genuine a lituation on your hands!",
        "Stop what you are doing and party!",
        "Are you not entertained?!",
        "Litness was inside of you the entire time.",
        "Lit like Bic.",
        "Pipe it up!",
        "As good a time as any to dab on em!",
        "Go get your destiny!",
        "Lowkey like tyring a Patti Pie for the first time!",
        "It may never be this lit again. Savor this.",
        "Crossover to the lit side.",
        "Well, look at you!"]
    
}
