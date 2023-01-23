# Description: This file contains the configuration for the shell scripts

# APP_VERSION is the version number of the app (This is the only thing you should change, the rest of the file can be left as is unless you want to change the app name or the destination directory for the archive)
APP_VERSION="1.0.9"

# Set the app name and destination directory for the archive
APP_NAME="sparkletest"
ARCHIVE_APP_DIR="$HOME/Desktop/$APP_NAME"

# For the free developer account, the signing certificate is "Apple Development," so if you change to a paid apple developer account, you have to change the grep string to something else
SIGNING_CERTIFICATE=$(security find-identity -v -p codesigning | grep "Apple Development" | awk '{print $2}')
TEAM_ID=$(security find-identity -v -p codesigning | grep "Apple Development" | awk -F'[()]' '{print $3}')

EXPORT_OPTIONS_PLIST="exportOptions.plist"

# Gets the path of the generate_appcast binary which is in ~/Library/Developer/Xcode/DerivedData/sparkletest-fqkskzevuwuhmcfjetohllfhqzis/SourcePackages/artifacts/sparkle/bin (the stuff after sparkletest- is a random string)
SPARKLE_BIN_DIR=$(find ~/Library/Developer/Xcode/DerivedData -name generate_appcast -type f -print0 | awk -F/ '{for(i=1;i<=NF;i++){if($i == "bin"){for(j=1;j<=i;j++){printf("%s/",$j)};break}};print ""}')
