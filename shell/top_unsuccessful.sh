#!/bin/sh

set -ue

filename=$1

awk '{print $9 "\tRequest: " $7}' ${filename} | grep -v '^200' | sort | uniq -c

