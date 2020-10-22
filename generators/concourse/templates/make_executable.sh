#!/bin/bash

git update-index --chmod=+x ci/tasks/build.sh
git update-index --chmod=+x ci/tasks/check-dependencies.sh
git update-index --chmod=+x ci/tasks/publish-snapshot.sh
git update-index --chmod=+x ci/tasks/veracode.sh
git update-index --chmod=+x ../gradlew

rm "$0"
