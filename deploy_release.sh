source shellconfig.sh
source .env

./generate_appcast.sh

# Export GITHUB_TOKEN from .env for use by github-release cli (Generate a PAT token from Github user settings)
export GITHUB_TOKEN=$GITHUB_TOKEN

# Create a new tag for the release and push it to GitHub
git tag -a v$APP_VERSION -m "v$APP_VERSION" && git push --tags

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

# Upload the archive to the release
github-release upload \
    --user $GITHUB_USER \
    --repo $APP_NAME \
    --tag v$APP_VERSION \
    --name "$APP_NAME.$RELEASE_FILE_EXTENSION" \
    --file "$ARCHIVE_APP_DIR/$APP_NAME.$RELEASE_FILE_EXTENSION"
