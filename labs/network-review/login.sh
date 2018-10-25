#!/bin/bash
ssh root@master1 systemctl stop iptables
ssh root@master2 systemctl stop iptables
ssh root@master3 systemctl stop iptables
oc login -u developer -p redhat https://console.lab.example.com  --insecure-skip-tls-verify
