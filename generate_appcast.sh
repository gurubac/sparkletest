# Description: Generates the appcast.xml file for Sparkle

# Fetch the release notes from GitHub
# github-release info -u gurubac -r sparkletest -t $VERSION >release_notes.txt

# Add the release notes to the appcast.xml file
# sed -i '' 's|<item>|<item>\n      <description>$(cat release_notes.txt)</description>|' appcast.xml
