#!/bin/bash
#Package & Publish binary artifacts
set -e -x # fail fast
echo "Entering upload!!!!"
export TERM=${TERM:-dumb}
resource_dir=$(dirname $0)
echo ${resource_dir}

mv temp-storage/${APP_NAME}*.war deploy-output/${APP_NAME}.war
mkdir deploy-output/version
echo "-SNAPSHOT">> build-version/number
mv build-version/number deploy-output/version/number
