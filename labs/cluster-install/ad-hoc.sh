#!/bin/bash
#
# Copyright 2017 Red Hat, Inc.
#
# NAME
#     ad-hoc.sh - lab grading script DO380 - Chapter 4
#
# Author: Razique Mahroua <rmahroua@redhat.com>
#

if [[ "$(hostname)" == "console.lab.example.com" ]]; then
  ansible -i hosts-ucf nodes -m shell -a "systemctl is-active atomic-openshift-node.service"
else
  echo "Please run this script from console"
fi