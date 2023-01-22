# Call archive.sh to archive the app
./archive.sh

ARCHIVE_APP_DIR="$HOME/Desktop/sparkletest"

# Create the DMG, from build directory and put it in the destination directory
create-dmg \
    --volname "sparkletest" \
    --codesign "8S6PWN6A5K" \
    "$ARCHIVE_APP_DIR/sparkletest.dmg" \
    "$ARCHIVE_APP_DIR/sparkletest.app"
