#!/bin/sh

filename=$1

awk '{print $4}' ${filename} | cut -d: -f2-3 | uniq -c
