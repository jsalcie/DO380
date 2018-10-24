Steps to migrate from NFS to glusterfs

If a storage class is not present (in other words, standard provisioning)
1:  Create this PV:
kind: PersistentVolume
apiVersion: v1
metadata:
  name: gluster-registry-volume
  labels:
    glusterfs: registry-volume
spec:
  capacity:
    storage: 10Gi
  glusterfs:
    endpoints: glusterfs-registry-endpoints
    path: gluster-registry-volume
  accessModes:
  - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain

2: Create this PVC
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: gluster-registry-claim
spec:
  accessModes:
   - ReadWriteMany
  resources:
    requests:
      storage: 10Gi
  storageClassName: glusterfs-storage
  selector:
      matchLabels:
          glusterfs: registry-volume

Then, run the following commands.
Skip steps 3, 4, 5, 6, and 7 if you do not want to save the data

3: Crashes the pod: oc set env dc/docker-registry REGISTRY_STORAGE_MAINTENANCE_READONLY_ENABLED=true
4: oc volume dc/docker-registry --add --name=gluster-registry-storage -m /gluster-registry -t pvc --claim-name=gluster-registry-claim
deploymentconfig "docker-registry" updated
5: export REGISTRY_POD=$(oc get pod --selector="docker-registry=default" -o go-template --template='{{printf "%s" ((index .items 0).metadata.name)}}')
6: oc rsync $REGISTRY_POD:/registry/ $REGISTRY_POD:/gluster-registry/
7: oc volume dc/docker-registry --remove --name=gluster-registry-storage
8: oc volume dc/docker-registry --add --name=registry-storage -t pvc --claim-name=gluster-registry-claim --overwrite
deploymentconfig "docker-registry" updated