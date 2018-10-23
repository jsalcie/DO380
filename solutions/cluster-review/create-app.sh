#!/bin/bash
#
# Copyright 2017 Red Hat, Inc.
#
# NAME
#     create-app.sh - lab grading script DO380 - Chapter 4
#
# Author: Razique Mahroua <rmahroua@redhat.com>
#
user='developer'
pass='redhat'
target='console.lab.example.com'
app_name='cluster-app'
image='hello-openshift'
host='workstation'

if [[ "$(hostname)" == "${host}.lab.example.com" ]]; then
  oc login https://${target}:443 --insecure-skip-tls-verify=true -u ${user} -p ${pass}
  oc new-app --name=${app_name} --docker-image=registry.lab.example.com:5000/openshift/${image} --insecure-registry
  # If needed
  # oc expose svc cluster-app --hostname=cloud.apps.lab.example.com
else
  echo "Please run this script from ${host}"
fi