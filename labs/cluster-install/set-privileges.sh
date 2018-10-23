#!/bin/bash
#
# Copyright 2017 Red Hat, Inc.
#
# NAME
#     set-privileges.sh - lab grading script DO380 - Chapter 4
#
# Author: Razique Mahroua <rmahroua@redhat.com>
#

if [[ "$(hostname)" == "master1.lab.example.com" ]]; then
  oc adm policy add-cluster-role-to-user cluster-admin admin
else
  echo "Please run this script from master1"
fi