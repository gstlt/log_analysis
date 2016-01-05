#!/bin/sh

set -eu

filename=$1

awk -F'"' '{num_reqs[$6]++}END{ for (agent in num_reqs) print num_reqs[agent] "\t" agent}' ${filename} | sed 's/(\([^;]\+; [^;]\+\)[^)]*)/(\1)/' | sort -rn | head -10

