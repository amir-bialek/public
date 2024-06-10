[[_TOC_]]

# General

We are using Prometheus Stack Alert version 48.1.1 to monitor the cluster.
This version can also send us live notification.

You can always get the latest version under https://dev.azure.com/MprestEA/Devops/_git/Helms -> Other/kube-prometheus-stack

The values.yaml is the original, the values-dev.yaml is the one should be use to over-write the changes, like so:
```
helm install Kube-Prometheus-Stack . -f ./values-dev.yaml
 ```

* The current version can give alert to email, slack, teams. change the configuration to match your needs.

* Alerts are given on deployments, StatefulSets, jobs, node Ram, node cpu, node Volume. 



# Installation

* The version need a pre-made secret with the following data:
```
apiVersion: v1
data:
  admin-password: <some password>
  admin-user: <some user>
kind: Secret
metadata:
  name: grafana
type: Opaque
```
Run test locally when using this value. it was rather tricky to get the base64 currectly.

* Change the cluster name under ```commonValue: &clusterName development```.


* There is an alert on 'no job data', so if you deploy this version in a cluster without jobs, be sure to change the value or comment it out.

# Additional checks

* We might have problem with the crt (same as elastic), check it with argocd.
* Still need to check the retention policy,
* Will be great if we can get special alert about the masternode.