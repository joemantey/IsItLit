//
//  JSExtensions.swift
//  IsItLit
//
//  Created by Norma Smalls-Mantey on 12/11/15.
//  Copyright © 2015 Joseph Smalls-Mantey. All rights reserved.
//

import UIKit

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