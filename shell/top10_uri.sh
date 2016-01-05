#!/bin/sh

set -ue

filename=$1

awk -F\" '{req=$2; sub(/[A-Z]{3,} [\/]+/, "", req); split(req, uri_arr, /[\/ \?]/); print "/" uri_arr[1]}' ${filename} | sort | uniq -c | sort -nr | head -10

