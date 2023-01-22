# Call archive.sh to archive the app
./archive.sh

ARCHIVE_APP_DIR="$HOME/Desktop/sparkletest"
TEAM_ID=$(security find-identity -v -p codesigning | grep "Apple Development" | awk -F'[()]' '{print $3}')

# Create the DMG, from build directory and put it in the destination directory
create-dmg \
    --volname "sparkletest" \
    --codesign $TEAM_ID \
    "$ARCHIVE_APP_DIR/sparkletest.dmg" \
    "$ARCHIVE_APP_DIR/sparkletest.app"
