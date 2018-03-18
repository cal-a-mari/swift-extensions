//
//  String+Subscript.swift
//  Mari
//
//  Created by Mari Batilando on 3/17/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

import Foundation

extension String {
    subscript(i: Int) -> Character {
        let i = index(startIndex, offsetBy: i)
        return self[i]
    }
    
    subscript(range: ClosedRange<Int>) -> Substring {
        let i = index(startIndex, offsetBy: range.lowerBound)
        let j = index(startIndex, offsetBy: range.upperBound)
        return self[i...j]
    }
    
    subscript(range: Range<Int>) -> Substring {
        let i = index(startIndex, offsetBy: range.lowerBound)
        let j = index(startIndex, offsetBy: range.upperBound)
        return self[i..<j]
    }
}
