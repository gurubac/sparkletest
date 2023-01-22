# Call archive.sh to archive the app
./archive.sh

APP_NAME="sparkletest"

ARCHIVE_APP_DIR="$HOME/Desktop/$APP_NAME"
TEAM_ID=$(security find-identity -v -p codesigning | grep "Apple Development" | awk -F'[()]' '{print $3}')

# Create the DMG, from build directory and put it in the destination directory
create-dmg \
    --volname "$APP_NAME" \
    --codesign $TEAM_ID \
    "$ARCHIVE_APP_DIR/$APP_NAME.dmg" \
    "$ARCHIVE_APP_DIR/$APP_NAME.app"
