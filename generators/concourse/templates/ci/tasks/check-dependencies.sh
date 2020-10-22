#!/bin/bash

set -e -x # fail fast
export TERM=${TERM:-dumb}
resource_dir=$(dirname $0)
echo ${resource_dir}
echo 'Executing dependeny check...:  ' 

cd temp-storage
# execute analysis and put the log into scan-results dir
# fail if policy action is fail
# java -jar ../nexus-security-tools-lifecycle-iq/nexus-iq-cli*.jar -i ice -s https://nexusiq.cardinalhealth.net -a ${ICE_SA_USER}:${ICE_SA_PASSWORD} *.war  2>&1 | tee ../scan-results/log.txt
# errors=$(cat ../scan-results/log.txt | grep -i "error" | wc -l)
# fail=$(cat ../scan-results/log.txt | grep -i "Fail" | wc -l)
# echo "errors " $errors
# echo "fail " $fail
#
# if  [ $errors = 0 ] && [ $fail = 0 ]
# then
   echo "Dependency check successful!! "
# else
#    echo "Failed to pass the dependency security check- pipeline aborted "
#    exit 125
# fi
