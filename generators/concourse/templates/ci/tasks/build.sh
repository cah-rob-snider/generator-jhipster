#!/bin/sh

set -e -x # fail fast
export TERM=${TERM:-dumb}
export ROOT_FOLDER=$(pwd)
export GRADLE_USER_HOME="${ROOT_FOLDER}/.gradle"
resource_dir=$(dirname $0)
echo ${resource_dir}
mkdir sonarqube-analysis-input/build
mkdir build-out/version
mkdir sonarqube-analysis-input/build/jacoco
cd project-source

npm config set cache $(pwd)/.npm --global

#build
./gradlew -Pprod -Pwar clean test integrationTest jacocoTestReport bootWar

#  move files to appropiate directories
cp -R build/libs/${APP_NAME}-*.war ../build-out
# cp -R ./build/* ../../sonarqube-analysis-input/build/
rsync -a ./* ../sonarqube-analysis-input/ --exclude node_modules
echo "TEMP-SNAPSHOT" > ../build-out/version/number
