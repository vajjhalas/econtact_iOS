//
//  ThemeManager.swift
//  EZKontact
//
//  Created by iosdev on 13/12/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
enum Theme: Int {
    
    case violetTheme, theme2
    
    var mainColor: UIColor {
        switch self {
        case .violetTheme:
            return UIColor().colorFromHexString("6740B4")//violet
        case .theme2:
            return UIColor().colorFromHexString("000000")
        }
    }
    
    //Customizing the Navigation Bar
    var barStyle: UIBarStyle {
        switch self {
        case .violetTheme:
            return .default
        case .theme2:
            return .black
        }
    }
    
    var navigationBackgroundImage: UIImage? {
        return nil
    }
    
    var tabBarBackgroundImage: UIImage? {
        return nil
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .violetTheme:
            return UIColor().colorFromHexString("ffffff")
        case .theme2:
            return UIColor().colorFromHexString("000000")
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .violetTheme:
            return UIColor().colorFromHexString("ffffff")
        case .theme2:
            return UIColor().colorFromHexString("000000")
        }
    }
    
    var titleTextColor: UIColor {
        switch self {
        case .violetTheme:
            return UIColor().colorFromHexString("ffffff")
        case .theme2:
            return UIColor().colorFromHexString("000000")
        }
    }
    var subtitleTextColor: UIColor {
        switch self {
        case .violetTheme:
            return UIColor().colorFromHexString("ffffff")
        case .theme2:
            return UIColor().colorFromHexString("000000")
        }
    }
}

// Enum declaration
let SelectedThemeKey = "SelectedTheme"

// This will let you use a theme in the app.
class ThemeManager {
    
    // ThemeManager
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .theme2
        }
    }
    
    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        
        UINavigationBar.appearance().barStyle = theme.barStyle
        UINavigationBar.appearance().backgroundColor = theme.mainColor
        UINavigationBar.appearance().tintColor = theme.backgroundColor
        UINavigationBar.appearance().barTintColor = theme.mainColor
        
    }
}
