//
//  NSResponder+Validation.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2019-02-18.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Cocoa

public extension NSResponder {

    /// Performs validation on the responder's touchbar, if any.
    ///
    /// This function performs the validation on the receiver's touchbar, if it had one.
    ///
    /// It does nothing if invoked on < 10.12.2
    func validateTouchBar() {
        if #available(OSX 10.12.2, *) {
            touchBar?.validate()
        }
    }
}
