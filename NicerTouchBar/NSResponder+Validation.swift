//
//  NSResponder+Validation.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2019-02-18.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Cocoa

public extension NSResponder {
    func validateTouchBar() {
        if #available(OSX 10.12.2, *) {
            touchBar?.validate()
        }
    }
}
