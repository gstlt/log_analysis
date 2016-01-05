#!/bin/sh

set -eu

filename=$1
tmp_file=/tmp/ips_list

awk '{num_reqs[$1]++}END{ for (ip in num_reqs) print num_reqs[ip] " " ip}' ${filename} | sort -rn | head -10 | awk '{print $2}' > ${tmp_file}

while read line
do
  echo "For IP ${line}"
  grep "${line}" $filename | awk '{print $7}' access.log | sort | uniq -c | sort -rn | head -5
  echo ""
done <${tmp_file}

