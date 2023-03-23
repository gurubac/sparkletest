## What is this?
An automated way to create and upload a new release of your MacOS app to Github Releases, as well as an example of how to integrate the Sparkle auto update framework into your app.

## Why did I make this?
I did not want to open Xcode to archive and create a .app file of my MacOS application. I preferred a CLI option to do this. 

Commands like `agvtool` do not work on newer versions of Xcode like Xcode 14. 

Instead of using these commands, you can just directly edit the CURRENT_PROJECT_VERSION in the `project.pbxproj` file using the `sed` command. 

These shell scripts automate the whole process of archiving an app, creating a dmg, generating the Sparkle `appcast.xml` file, and uploading to Github Releases. 

The app checks for updates from these Github Releases using Sparkle. 


## How to run it?
Edit the config variables in the `shellconfig.sh` file. 
To generate a new release of your app and upload to github, run `./deploy_release.sh`


### Guides that helped me
https://github.com/matteospada/Sparkle-test

https://medium.com/@matteospada.m/how-to-integrate-the-sparkle-framework-into-a-swiftui-app-for-macos-98ca029f83f7

Dependencies: https://github.com/sparkle-project/Sparkle

(shell scripts deps) create-dmg - https://github.com/create-dmg/create-dmg
