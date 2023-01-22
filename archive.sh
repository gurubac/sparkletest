#!/bin/bash

APP_NAME="sparkletest"
# Archive the app with Xcode
xcodebuild archive -project $APP_NAME.xcodeproj -scheme $APP_NAME -configuration Release -derivedDataPath build -archivePath build/$APP_NAME.xcarchive

# Create the exportOptions.plist file
EXPORT_OPTIONS_PLIST="exportOptions.plist"

# Get the signing certificate and provisioning profile values
SIGNING_CERTIFICATE=$(security find-identity -v -p codesigning | grep "Apple Development" | awk '{print $2}')
TEAM_ID=$(security find-identity -v -p codesigning | grep "Apple Development" | awk -F'[()]' '{print $3}')

# Edit the exportOptions.plist file
cat > $EXPORT_OPTIONS_PLIST <<EOF
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

# VERSION=$(xcodebuild -project sparkletest.xcodeproj -showBuildSettings | grep "MARKETING_VERSION" | awk '{print $3}')

# Create a new directory for the .dmg file
# SPARKLE_BUILD_DIR_SRC="build/Build/Products/Release/sparkletest.app"
# SPARKLE_TEST_DIR_DEST="$HOME/Desktop/sparkletest"

# # If destination directory exists, delete it
# if [ -d "$SPARKLE_TEST_DIR_DEST" ]; then
#     rm -rf "$SPARKLE_TEST_DIR_DEST"
# fi

# mkdir "$SPARKLE_TEST_DIR_DEST"

# # Create the DMG, from build directory and put it in the destination directory
# create-dmg \
#     --volname "sparkletest" \
#     --codesign "8S6PWN6A5K" \
#     "$SPARKLE_TEST_DIR_DEST/sparkletest.dmg" \
#     "$SPARKLE_BUILD_DIR_SRC/sparkletest.app"

# Generate the initial appcast.xml file using the generate_appcast binary
# Go to path ~/Library/Developer/Xcode/DerivedData/sparkletest-fqkskzevuwuhmcfjetohllfhqzis/SourcePackages/artifacts/sparkle/bin

# SPARKLE_BIN_DIR=$(find ~/Library/Developer/Xcode/DerivedData -name generate_appcast -type f -print0 | awk -F/ '{for(i=1;i<=NF;i++){if($i == "bin"){for(j=1;j<=i;j++){printf("%s/",$j)};break}};print ""}')
# echo "Path of the generate_appcast binary: $SPARKLE_BIN_DIR"

# # execute the generate_appcast binary inside the SPARKLE_BIN_DIR
# "$SPARKLE_BIN_DIR"generate_appcast $SPARKLE_TEST_DIR_DEST

# Fetch the release notes from GitHub
# github-release info -u gurubac -r sparkletest -t $VERSION > release_notes.txt

# Add the release notes to the appcast.xml file
# sed -i '' 's|<item>|<item>\n      <description>$(cat release_notes.txt)</description>|' appcast.xml
