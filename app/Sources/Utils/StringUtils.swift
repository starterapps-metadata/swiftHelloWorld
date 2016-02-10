/**
* StringUtils.swift
*
* Copyright © 2016 IBM. All rights reserved.
*/

import Foundation

#if os(OSX)

public extension String {
    func bridge() -> NSString {
        return self as NSString
    }
}

public extension NSString {
    func bridge() -> String {
        return self as String
    }
}

#endif
