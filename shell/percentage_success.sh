#!/bin/sh

set -ue

filename=$1

all_reqs=`cat access.log | wc -l`
success=`awk '{print $9}' access.log | grep 200 | wc -l`

percentage=`bc <<< "scale=2;${success}/${all_reqs}*100"`

echo "Success rate is: ${percentage}%"

