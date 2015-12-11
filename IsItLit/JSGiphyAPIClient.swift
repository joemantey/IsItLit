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


class JSGiphyAPIClient: NSObject {
    
    
    
     func getGif(type: Bool) ->String {
        
        var searchString = ""
        
        switch type{
            
            case true:
                searchString = "win"
            case false:
                searchString = "fail"
            
        }
        
        
        let baseURL     = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag="
        let searchURL   = baseURL + searchString
        
        let gifURL = completeGIFRequest(searchURL)

        return gifURL
    }
    
    
    
    func completeGIFRequest(inputURL: String) ->String {
        
        var returnURL = ""

        Alamofire.request(.GET, inputURL).validate().responseJSON { response in
            switch response.result {
            
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let gifURL = json["data"][ "url"]
                    returnURL = String(gifURL)
                    print("JSON: \(json)")
                }
            
            case .Failure(let error):
                print(error)
            }
        }
        
        return returnURL
    }
    
    
    
}
