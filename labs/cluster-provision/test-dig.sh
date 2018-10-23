#!/bin/bash
#
# Copyright 2017 Red Hat, Inc.
#
# NAME
#     test-dig.sh - lab grading script DO380 - Chapter 4
#
# Author: Razique Mahroua <rmahroua@redhat.com>
#

if [[ "$(hostname)" == "console.lab.example.com" ]]; then
  declare -a nodes=( console services master1 master2 master3 infra1 infra2 apps1 apps2 )
  for node in ${nodes[@]}; do
    dig ${node}.lab.example.com | grep "IN"
  done
else
  echo "Please run this script from console"
fi