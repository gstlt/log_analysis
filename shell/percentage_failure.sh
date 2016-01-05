#!/bin/bash

set -ue

filename=$1

all_reqs=`cat access.log | wc -l`
fail=`awk '{print $9}' ${filename} | grep -v 200 | wc -l`

user_error=`awk '{print $9}' ${filename} | grep '^4' | wc -l`
server_error=`awk '{print $9}' ${filename} | grep '^5' | wc -l`

percentage=`bc <<< "scale=2;${fail}/${all_reqs}*100"`

percentage_4x=`bc <<< "scale=2;${user_error}/${all_reqs}*100"`
percentage_5x=`bc <<< "scale=2;${server_error}/${all_reqs}*100"`

echo "Failure rate is: ${percentage}%"
echo "  4xx error rate is ${percentage_4x}%"
echo "  5xx error rate is ${percentage_5x}%"

