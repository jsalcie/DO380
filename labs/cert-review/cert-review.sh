openssl genrsa -out /root/openshift-install/lab.example.com/rootCA.key 2048
openssl req -new -key /root/openshift-install/lab.example.com/rootCA.key \
-out /root/openshift-install/lab.example.com/rootCA.csr \
-subj "/C=US/ST=NC/L=Raleigh/O=Red Hat Training/OU=IT/CN=lab.example.com" 
openssl x509 -req -days 366 \
-in /root/openshift-install/lab.example.com/rootCA.csr \
-signkey /root/openshift-install/lab.example.com/rootCA.key \
-out /root/openshift-install/lab.example.com/rootCA.crt
