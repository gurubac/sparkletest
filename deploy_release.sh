#!/bin/bash
# Description: This script is used to deploy a new release to GitHub. It will create a new tag, push the new appcast.xml file, and create a new release on GitHub. It will also upload the archive to the release.

source shellconfig.sh
source .env

./generate_appcast.sh

# Export GITHUB_TOKEN from .env for use by github-release cli (Generate a PAT token from Github user settings)
export GITHUB_TOKEN=$GITHUB_TOKEN

# Sync tags from remote repository before creating a new tag
git fetch --prune --prune-tags

# Check if the tag already exists
if git rev-parse "v$APP_VERSION" >/dev/null 2>&1; then
    echo "Tag v$APP_VERSION already exists. Please change the APP_VERSION in shellconfig.sh or delete the already existing release from Github to continue. Exiting program..."
    exit 1
fi

# Create a new tag for the release and push it to GitHub
git tag v$APP_VERSION && git push --tags

# Commit the changes to the appcast.xml file and push to GitHub
git add appcast.xml
git commit -m "Update appcast.xml to v$APP_VERSION"
git push

# Create a new release on GitHub
github-release release \
    --user $GITHUB_USER \
    --repo $APP_NAME \
    --tag v$APP_VERSION \
    --name "v$APP_VERSION" \
    --description "Release v$APP_VERSION. This is an automatic release created by the deploy_release.sh script. Check back later for updated release notes."

# Delete local tags to avoid conflicts from remote repository tags (AFTER CREATING RELEASE)
# If you prune before right creating the release, the tag will not be able to be uploaded to the remote repository
git fetch --prune --prune-tags

# Upload the archive to the release
github-release upload \
    --user $GITHUB_USER \
    --repo $APP_NAME \
    --tag v$APP_VERSION \
    --name "$APP_NAME.$RELEASE_FILE_EXTENSION" \
    --file "$ARCHIVE_APP_DIR/$APP_NAME.$RELEASE_FILE_EXTENSION"
