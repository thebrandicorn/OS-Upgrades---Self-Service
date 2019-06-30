#!/bin/bash

#Checks to make sure Installer App is present
if [ -d "/Applications/Install macOS High Sierra.app" ]; then
#Gives the user 15 minutes to prepare for the reboot
MSG="Your High Sierra upgrade will start in the next 15 minutes. Please save any work and click \"Ok\"."

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper \
-windowType hud -title "" -heading "MacOS Upgrade" -description "$MSG" -button1 "OK" \
-icon /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns -defaultButton 1 -timeout 900 -countdown -lockHUD

sleep 1

#Calls a curtain to prevent user interaction once the actual upgrade starts
sudo /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType fs -title "Test" -heading "Upgrade in Progress" -description "Your MacOS Upgrade has started. Your computer will reboot soon" -icon /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/InstallAssistant.icns >/dev/null 2>&1 &

#Starts the upgrade
/Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/startosinstall --agreetolicense --nointeraction --rebootdelay 45

#Script fails out if the installer isn't there. This prevents the curtain from being pulled unnecessarily
else
	echo "Installer Application Missing"
	exit 1
fi