#!/bin/bash
set -o errexit

declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
source "${currentDir}/build.properties"

DISTRIBUTION_NAME=oneconnect-theme-$THEME_VERSION

# prepare and zip the theme content
echo "info::: Removing an existing '$DISTRIBUTION_NAME.zip' file."
rm -rf $DISTRIBUTION_NAME.zip

mkdir oneconnect
echo "info::: Packaging oneconnect theme as '$DISTRIBUTION_NAME.zip'"

cp -rf theme/* oneconnect/
zip -r $DISTRIBUTION_NAME.zip oneconnect

echo "info::: Cleanup temp files and folders."
rm -rf oneconnect
