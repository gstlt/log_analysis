#!/bin/sh

set -eu

filename=$1

echo "Requests\tIP"

awk '{num_reqs[$1]++}END{ for (ip in num_reqs) print num_reqs[ip] "\t" ip}' ${filename} | sort -rn | head -10

