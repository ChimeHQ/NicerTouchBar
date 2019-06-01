//
//  NSViewController+Binding.swift
//  NicerTouchBar
//
//  Created by Matt Massicotte on 2018-12-16.
//  Copyright © 2018 Chime Systems. All rights reserved.
//

import Cocoa

public extension NSViewController {

    /// Clears bindings for the "touchBar" keypath on the host window.
    ///
    /// This function removes any installed bingings on the "touchBar" keypath for
    /// the window hosting this controllers' view.
    ///
    /// It does nothing if invoked on < 10.12.2
    func restoreParentWindowTouchBar() {
        if #available(OSX 10.12.2, *) {
            view.window?.unbind(NSBindingName(rawValue: #keyPath(touchBar)))
        }
    }

    /// Binds this controller's touchBar to the host window
    ///
    /// This function installs a binding in the window hosting this controllers' view
    /// to this controller's touchBar property.
    ///
    /// It does nothing if invoked on < 10.12.2
    func becomeParentWindowTouchBarProvider() {
        restoreParentWindowTouchBar()

        if #available(OSX 10.12.2, *) {
            view.window?.bind(NSBindingName(rawValue: #keyPath(touchBar)),
                              to: self,
                              withKeyPath: #keyPath(touchBar), options: nil)
        }
    }
}
