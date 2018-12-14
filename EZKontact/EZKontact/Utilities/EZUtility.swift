//
//  EZUtility.swift
//  EZKontact
//
//  Created by Supriya on 13/12/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import Foundation

extension String {
    
    func contains(_ find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(_ find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
