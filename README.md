# LocalMobileStarterSuite: Prepare and connect your mobile device

In order to run test cases on your local mobile device, you need to enable developer mode and allow usb debugging.

## Enable developer mode

The "de-facto" way of enabling developer mode is:

1. Go to "Settings" app
2. Scroll down untill you see build number
3. Tap Build number seven times

You should see a message flashing on the screen for few seconds if developer mode was correctly activated. In addition, you should see additional menu Developer options under Settings app (either directly under Settings or under Settings > System).

**_NOTE:_** The may be differences between different vendors and/or device model on how to enable developer mode. If the above instructions do not work for you, please refer to your device’s user manual.

## Allow usb debugging

To allow USB debugging, go to your Developer options menu (Settings or Settings > System). Turn on the switch "USB debugging".

## How to check application's Package (appPackage) and Activity (appActivity)

To launch calculator-application on your device you need to know application's Package (appPackage) and Activity (appActivity).
If you don't allready know appPackage/appActivity you can check it using Android Debug Bridge (adb). Android Debug Bridge is a versatile command-line tool that lets you communicate with a device.

How to check calculator's appPackage/appActivity:
1) Connect your Android device to the computer via USB cable
2) Launch calculator on you mobile device
3) Open Command Prompt on your computer
4) Type command following command to the Command Prompt and press enter:
    
    Android version < 10
    - adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
    
    Android version = > 10
    - adb shell "dumpsys window displays | grep -E 'mCurrentFocus|mFocusedApp'"

![appPackage/appActivity cmd Screen Shot][appPackage-appActivity]

[appPackage-appActivity]: ./images/appPackage_appActivity.png

Where first part _com.sec.android.app.popupcalculator_ is appPackage and second part _com.sec.android.app.popupcalculator.Calculator_ is appActivity.

## Add appPackage/appActivity to the yaml configuration file

Open config.yaml from resources/resources folder and add correct appPackage/appActivity values in the _sessions:_ section.

![yaml appPackage/appActivity Screen Shot][yaml-appPackage-appActivity]

[yaml-appPackage-appActivity]: ./images/yaml_appPackage_appActivity.png