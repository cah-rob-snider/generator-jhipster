#!/bin/bash

set -e -x # fail fast
export TERM=${TERM:-dumb}
resource_dir=$(dirname $0)
echo ${resource_dir}

#parameters to pass --- > appName ; busUnit; team;  filePath 

DATE=`date +"%Y-%m-%d-%H%M"`

mv ./nexus-security-tools-veracode/*.jar ./nexus-security-tools-veracode/staticAnalysisWrapper.jar
mv ./temp-storage/*.war ./temp-storage/${APP_NAME}.war
#/opt/jdk/bin/java -jar ./nexus-security-tools-veracode/staticAnalysisWrapper.jar "ice-perf-dashboard" "ICE" "Cardinal Health at Home" "./temp-storage/${APP_NAME}.war" ${VERACODE_API_ID} ${VERACODE_API_KEY}
