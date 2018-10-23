openssl genrsa -out /root/openshift-install/openshift-cluster/mycluster.com/rootCA.key 2048
openssl req -new -key /root/openshift-install/openshift-cluster/mycluster.com/rootCA.key \
-out /root/openshift-install/openshift-cluster/mycluster.com/rootCA.csr \
-subj "/C=US/ST=NC/L=Raleigh/O=Red Hat Training/OU=IT/CN=mycluster.com" 
openssl x509 -req -days 366 \
-in /root/openshift-install/openshift-cluster/mycluster.com/rootCA.csr \
-signkey /root/openshift-install/openshift-cluster/mycluster.com/rootCA.key \
-out /root/openshift-install/openshift-cluster/mycluster.com/rootCA.crt