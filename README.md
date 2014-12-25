SwiftColorPicker
================

A Photoshop-like color picker for iOS devices implemented in Swift.

##ToDo:
(Pull requests welcome)

1. Initialize ColorPicker with a color (currently defaults to red)
2. Provide plumbing to set the color programmatically to the ColorPicker after instantiation. This will obviously need to do everything included in picking a color; move the crosshairs and the main color selector, update the views, etc.
3. Test modifying the size of the containing UIView to determine if the ColorPicker can handle it.
3. Provide better documentation all around.
4. Unit tests.

##How to use
Including the SwiftColorPicker in your application is fairly straightforward. Copy lib/SwiftColorPicker into your project and associate the UIView: ColorPicker to the UIView that you would like the ColorPicker to live. The size/dimensions of the UIView that you use to init the ColorPicker will dictate the size of the ColorPicker.
