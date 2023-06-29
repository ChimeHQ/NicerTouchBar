[![Build Status][build status badge]][build status]
[![License][license badge]][license]
[![Platforms][platforms badge]][platforms]

# NicerTouchBar

NicerTouchBar includes useful utilities for `NSTouchBar`/`NSTouchBarItem` validation, as well as some convenience methods for influencing `NSTouchBar` behavior/setup.

## Validation

While we have `NSMenuItemValidation` and `NSUserInterfaceValidations`, as of 10.15, `NSTouchBar` doesn't have a good validation system. This library introduces a `TouchBarItemValidations` protocol, which is checked first during the touch bar validation process. As a fallback, `NSUserInterfaceValidations` is checked if appropriate.

```swift
public protocol TouchBarItemValidations {
    @available(OSX 10.12.2, *)
    func validateTouchBarItem(_ item: NSTouchBarItem) -> Bool
}
```

Validation is `NSTouchBarItem`-subclass dependent. Currently, `NSGroupTouchBarItem` and `NSPopoverTouchBarItem` are supported. `NSCustomTouchBarItem` is supported **if** its view property is a subclass of `NSControl`.

## Triggering Validation

Because this validation isn't provided by the system, you have to do some work to wire it up. You can just use the `validate` method on `NSTouchBar` directly. This is manual, but can be efficient, especially if your validation needs are simple.

A fancier way is to hook into NSWindow/NSApplication's `didUpdateNotification`. This gives you a easy way to run your validation automatically as the window/app processes events.

And, as a convenience, there are a few functions/extensions that make it easier to manually validate.

```swift
class MyViewController: NSViewController {
    func myFunction() {
        // this can be called safely before 10.12.2
        validateTouchBar()
        // or (cannot be called before 10.12.2)
        touchbar?.validate()
    }
}
```

## Overriding a Window's TouchBar

It sometimes happens that you need to override a window's default touch bar. Instead of messing with binding, you can use a handy extension on `NSViewController`.

```swift
deinit {
    restoreParentWindowTouchBar()
}

override func viewWillAppear() {
    super.viewWillAppear()

    becomeParentWindowTouchBarProvider()
}
```

### Installation

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/NicerTouchBar")
]
```

### Suggestions or Feedback

We'd love to hear from you! Get in touch via an issue or pull request.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[build status]: https://github.com/ChimeHQ/NicerTouchBar/actions
[build status badge]: https://github.com/ChimeHQ/NicerTouchBar/workflows/CI/badge.svg
[license]: https://opensource.org/licenses/BSD-3-Clause
[license badge]: https://img.shields.io/github/license/ChimeHQ/NicerTouchBar
[platforms]: https://swiftpackageindex.com/ChimeHQ/NicerTouchBar
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FNicerTouchBar%2Fbadge%3Ftype%3Dplatforms
