//
//  JSLogic.swift
//  IsItLit
//
//  Created by Joseph Smalls-Mantey on 12/2/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit


class JSLogic: NSObject {
    

   

    
    class func returnYesOrNo () -> (Bool){
        
        let responseRandomizer = Int(arc4random_uniform(UInt32(10)))
        
        if responseRandomizer > 5 {
            return true
        }else{
            return false
        }
    }
    

    
    
}

