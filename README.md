# OS Upgrades Scripts for Self Service
Use these scripts in a Jamf Service policy to trigger an upgrade to the OS named in the script

These scripts check for the presence of their respective MacOS Installers in the /Applications folder. If the installer is present, then the user is given 15 minutes to save/close any work before a Jamf curtain is pulled, and the MacOS installer's built-in startosinstall command is run.

If you want a single  Self Service policy to both copy the installer to the Applications folder, and run this script, then make sure this script's run priority is set to run After.
