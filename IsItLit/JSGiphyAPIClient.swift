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


public class JSGiphyAPIClient: NSObject {
    
    
    
      func getGif(type: Bool){
        
        var searchString = ""
        
        switch type{
            
            case true:
                searchString = "win"
            case false:
                searchString = "epicfail"
        
        }
        
        let baseURL     = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag="
        let searchURL   = baseURL + searchString
        
        
        var returnURL = ""
        
        
        Alamofire.request(.GET, searchURL).validate().responseJSON { response in
            switch response.result {
                
            case .Success:
                if let value = response.result.value {
                
                    let json = JSON(value)
                    
                    print(json)
                    let gifURL  = json["data","image_original_url"].string
                    
                    
                    returnURL = gifURL!
                    
                    
                    
                    
                    
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(returnURL, forKey: GIFUrl.urlString)
                    
                    let nc = NSNotificationCenter.defaultCenter()
                    nc.postNotificationName("GIFisHere", object: nil)
            }
                
            case .Failure(let error):
                print(error)
            }
        }
    }

    
    public enum GIFUrl {
        
        static let urlString = "string"
    }
        
    
    
    
    
}
