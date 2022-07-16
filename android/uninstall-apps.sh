In this guide we will see step by step how to debloat the Galaxy Tab S8​

First of all we have to enable: Developer Options
Settings->About tablet->Software information->(tap 7 times)Build number

After that we will enable: OEM Unlocking & USB Debbuging
Settings->Developer Options->OEM Unlocking(ON) & USB Debbuging(ON)

On the next step we need to download & install : ADB & Fastboot tools
Once you install the tools, connect your {Tablet} - {PC}
Select: USB Debbuging & Open your: Terminal


We are almost there 😊

Now i will make a short explanation in order to understand what are we doing exactly & how we will do it.

What is ADB?
ADB provides us with commands that can be used to debug Android devices,
installing or uninstalling apps and getting information about a connected device.

adb shell

This command activates the remote shell command console on the connected Android smartphone or tablet.

adb shell pm uninstall -k --user 0

Using this, you can easily uninstall the unwanted system apps. To be able to execute it, you must issue 'adb shell' command first.
You can then use 'pm uninstall -k --user 0' followed by the Android app package name as shown below.

pm uninstall -k --user 0 com.whatsapp_2.20.apk

This command can help you if you want to remove all the bloatware from your phone.
Please note that most system apps don't have the 'Uninstall' option on the device but this command works magically.
If you don't know the app package name for the apps you want to remove, you can use adb shell pm list packages to find it out.

adb shell pm list packages

Using the above ADB Shell command, you can print the list of the app package names for all apps installed on your Android device.

You can use this command with different parameters to get a more specific list of app packages.
For instance, if you want to list the system apps only, use

adb shell pm list packages -s

In order to list all third-party apps installed on your Android phone or tablet, you issue the following command.

adb shell pm list packages -3

Do you want ADB Shell to show the list of all enabled or disabled apps on your device,
try the command with '-d' (disabled apps) and '-e' (for enabled apps) parameter.

adb shell pm list packages -d
adb shell pm list packages -e

Now, if pm list command troubles you or you are unsure that you are making the right choice you should stop right there
(uninstalling the wrong app might harm your tablet's operating system) and use another method for identifying which app you want to uninstall.

(GUI method - Graphical User Interface) For example: APK Inspector will provide you with a detailed list of installed packages (plus their icon) on your device, once you select an app, extra details will be shown to you & that's how you will get the correct name.of.the.app

Thanks for your time ❤​