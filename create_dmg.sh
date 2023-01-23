# Description: Create a DMG file from the app archive

source shellconfig.sh

# Call archive.sh to archive the app
./archive.sh

# Create the DMG, from build directory and put it in the destination directory
create-dmg \
    --skip-jenkins \
    --volname "$APP_NAME" \
    --codesign $TEAM_ID \
    "$ARCHIVE_APP_DIR/$APP_NAME.dmg" \
    "$ARCHIVE_APP_DIR/$APP_NAME.app"
