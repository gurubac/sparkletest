#!/bin/bash
# Description: Archive the app with Xcode and export it to the ARCHIVE_APP_DIR directory listed in shellconfig.sh

source shellconfig.sh

# Archive the app with Xcode
xcodebuild archive -project $APP_NAME.xcodeproj -scheme $APP_NAME -configuration Release -derivedDataPath build -archivePath build/$APP_NAME.xcarchive

# Edit the exportOptions.plist file
cat >$EXPORT_OPTIONS_PLIST <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>signingStyle</key>
    <string>manual</string>
    <key>signingCertificate</key>
    <string>$SIGNING_CERTIFICATE</string>
    <key>teamID</key>
    <string>$TEAM_ID</string>
</dict>
</plist>
EOF

# Export the archive to the destination directory with the exportOptions.plist file
xcodebuild -exportArchive -archivePath build/$APP_NAME.xcarchive -exportPath $HOME/Desktop/$APP_NAME -exportOptionsPlist $EXPORT_OPTIONS_PLIST
