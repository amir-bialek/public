# template

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm template for micro services in Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://mprestg-docker-local.jfrog.io/artifactory/derms-ad-helm/ | library | 1.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMaps.cms | list | `[]` | List of configMaps (Required). |
| configMaps.enabled | bool | `false` | Whether to enable the creation of configMaps (Required). |
| deployment.affinity | object | `{"nodeAffinity":{"enabled":false,"labelKey":"nodeGroup","labelValue":"basic"},"podSelfAntiAffinity":{"enabled":true}}` | Affinity parameters for scheduling the deployment (Optional). |
| deployment.affinity.nodeAffinity | object | `{"enabled":false,"labelKey":"nodeGroup","labelValue":"basic"}` | Schedule deployment's pod only on a specific node (Required). |
| deployment.affinity.nodeAffinity.labelKey | string | `"nodeGroup"` | Add node's label key (Required). |
| deployment.affinity.nodeAffinity.labelValue | string | `"basic"` | Add node's label value (Required). |
| deployment.affinity.podSelfAntiAffinity | object | `{"enabled":true}` | Enables you to prevent pods with specific labels or attributes from running together on the same node to enhance resilience and availability (Required). |
| deployment.args | list | `[]` | Additional arguments to pass to the container's main command (Optional). Note: The args field does not replace the main command; it augments it. |
| deployment.autoscaling | object | `{"enabled":false,"maxReplica":3,"minReplica":1,"targetCPUUtilizationPercentage":80,"targetMemoryUtilizationPercentage":80}` | Auto scaling with HPA (Required). Note: If enabled is true, replicasCount is not relevant. HPA will control the replicas. |
| deployment.autoscaling.enabled | bool | `false` | Enable auto scaling (Required). |
| deployment.autoscaling.maxReplica | int | `3` | Maximum number of replicas (Required). |
| deployment.autoscaling.minReplica | int | `1` | Minimum number of replicas (Required). |
| deployment.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization percentage (Required). |
| deployment.autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target memory utilization percentage (Required).  |
| deployment.command | list | `[]` | List of commands that replace the default command defined in the container image's Dockerfile (Optional). |
| deployment.containerSecurityContext | object | `{}` | Security context for containers inside deployment's pod (Required). |
| deployment.enabled | bool | `false` | Whether to create the deployment (Required). |
| deployment.env | object | `{"fromConfigMaps":[],"fromSecrets":[],"regular":{}}` | Environment Variables parameters for deployment (Required). |
| deployment.env.fromConfigMaps | list | `[]` | Environment Variables from ConfigMaps (Optional). |
| deployment.env.fromSecrets | list | `[]` | Environment Variables from secrets (Optional). Enables you to create environment variables from existing secrets. |
| deployment.env.regular | object | `{}` | Create Environment Variables (Optional). Create environment variables manually using key-value pairs. |
| deployment.image | object | `{"dockerregistry":"","name":"","pullPolicy":"","tag":""}` | Specify details of the deployment's image (Required). |
| deployment.image.dockerregistry | string | `""` | The Docker registry URL (Required). Note: If the Docker registry is private, you might need to use imagePullSecrets. |
| deployment.image.name | string | `""` | The Docker image name (Required). Note: No need to add '/' at the beginning. |
| deployment.image.pullPolicy | string | `""` | Pull policy for pod restarts (Required). |
| deployment.image.tag | string | `""` | The Docker image tag (Required). |
| deployment.imagePullSecrets | list | `[]` | Use a secret that contains private Docker registry credentials (Optional). |
| deployment.labels | object | `{}` | Add labels to deployment (Optional). |
| deployment.liveness | object | `{"failureThreshold":5,"httpHeaders":[{"name":"X-Tenant-Id","value":"app"},{"name":"X-Source-Id","value":"app"}],"includeLivenessProbe":false,"initialDelay":300,"name":"liveness-port","period":15,"probePath":"/actuator/health","probePort":8090,"protocol":"TCP","scheme":"HTTP","successThreshold":1,"timeout":45}` | Liveness parameters for deployment (Required). |
| deployment.liveness.failureThreshold | int | `5` | After a probe fails failureThreshold times in a row, Kubernetes considers that the overall check has failed: the container is not ready/healthy/live (Required). |
| deployment.liveness.httpHeaders | list | `[{"name":"X-Tenant-Id","value":"app"},{"name":"X-Source-Id","value":"app"}]` | Custom headers to set in the request. HTTP allows repeated headers (Optional). |
| deployment.liveness.httpHeaders[0] | object | `{"name":"X-Tenant-Id","value":"app"}` | The name of a custom header (Optional). |
| deployment.liveness.httpHeaders[0].value | string | `"app"` | The value of a custom header (Optional). |
| deployment.liveness.httpHeaders[1].value | string | `"app"` | The value of a custom header (Optional). |
| deployment.liveness.includeLivenessProbe | bool | `false` | If true will include liveness in the deployment based on the parameters specified on '.deployment.liveness' (Required). |
| deployment.liveness.initialDelay | int | `300` | Number of seconds after the container has started before startup, liveness or readiness probes are initiated (Required). |
| deployment.liveness.name | string | `"liveness-port"` | The name of the port that will be created inside the container (Required). |
| deployment.liveness.period | int | `15` | How often (in seconds) to perform the probe. Default to 10 seconds. The minimum value is 1 (Required). |
| deployment.liveness.probePath | string | `"/actuator/health"` | The path to access on the HTTP server (Required). |
| deployment.liveness.probePort | int | `8090` | The number of the port that will be created inside the container and the service(if enabled) (Required). |
| deployment.liveness.protocol | string | `"TCP"` | The protocol of the port that will be create inside the container and the service (Required). |
| deployment.liveness.scheme | string | `"HTTP"` | Scheme to use for connecting to the host (HTTP or HTTPS) (Required). |
| deployment.liveness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup Probes. Minimum value is 1. |
| deployment.liveness.timeout | int | `45` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1 (Required). |
| deployment.name | string | `""` | Deployment name (Required). |
| deployment.nodeSelector | object | `{}` | Add node labels to schedule deployment on specific nodes (Optional). |
| deployment.podAnnotations | object | `{}` | Add annotations directly to deployment's pod (Optional). |
| deployment.podSecurityContext | object | `{}` | Deployment pod's security context (Required). |
| deployment.readiness | object | `{"failureThreshold":5,"httpHeaders":[{"name":"X-Tenant-Id","value":"app"},{"name":"X-Source-Id","value":"app"}],"includeReadinessProbe":false,"initialDelay":45,"name":"readiness-port","openContainerPort":false,"openServicePort":false,"period":15,"probePath":"/actuator/health","probePort":8090,"protocol":"TCP","scheme":"HTTP","successThreshold":1,"timeout":45}` | Readiness parameters for deployment (Required). |
| deployment.readiness.failureThreshold | int | `5` | After a probe fails failureThreshold times in a row, Kubernetes considers that the overall check has failed: the container is not ready/healthy/live (Required). |
| deployment.readiness.httpHeaders | list | `[{"name":"X-Tenant-Id","value":"app"},{"name":"X-Source-Id","value":"app"}]` | Custom headers to set in the request. HTTP allows repeated headers (Optional). |
| deployment.readiness.httpHeaders[0] | object | `{"name":"X-Tenant-Id","value":"app"}` | The name of a custom header (Optional). |
| deployment.readiness.httpHeaders[0].value | string | `"app"` | The value of a custom header (Optional). |
| deployment.readiness.httpHeaders[1].value | string | `"app"` | The value of a custom header (Optional). |
| deployment.readiness.includeReadinessProbe | bool | `false` | If true will include readiness in the deployment based on the parameters specified on .deployment.readiness (Required). |
| deployment.readiness.initialDelay | int | `45` | Number of seconds after the container has started before startup, liveness or readiness probes are initiated (Required). |
| deployment.readiness.name | string | `"readiness-port"` | The name of the port that will be created inside the container (Required). |
| deployment.readiness.openContainerPort | bool | `false` | If true will open readiness port in the deployment's pod (Required). Note: the probe port number based on the parameter '.deployment.readiness.probePort'. |
| deployment.readiness.openServicePort | bool | `false` | If true will enable the creation of readiness port in the deployment's service based on the parameter '.deployment.readiness.probePort' (Required). Note: This field only enables the possibility to add probPort in a service. It depends on service's config values, if .service.enabled and .service.services[].enableProbePort enabled.  |
| deployment.readiness.period | int | `15` | How often (in seconds) to perform the probe. Default to 10 seconds. The minimum value is 1 (Required). |
| deployment.readiness.probePath | string | `"/actuator/health"` | The path to access on the HTTP server (Required). |
| deployment.readiness.probePort | int | `8090` | The number of the port that will be created inside the container and the service(if enabled) (Required). |
| deployment.readiness.protocol | string | `"TCP"` | The protocol of the port that will be create inside the container and the service (Required). |
| deployment.readiness.scheme | string | `"HTTP"` | Scheme to use for connecting to the host (HTTP or HTTPS) (Required). |
| deployment.readiness.successThreshold | int | `1` | Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup Probes. Minimum value is 1. |
| deployment.readiness.timeout | int | `45` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1 (Required). |
| deployment.replicasCount | int | `1` | The number of replicas the deployment will create (Optional). Note: Relevant only if autoscaling.enabled is false. |
| deployment.resources | object | `{}` | Resource requests and limits for deployment's pods (Required). Note: .deployment.resources.limits & .deployment.resources.requests are optional. |
| deployment.revisionHistoryLimit | int | `3` | Determines how many historical versions of a workload's configuration are retained in the cluster (Required). |
| deployment.tolerations | list | `[]` | Add tolerations to schedule deployment on specific nodes (Optional). |
| deployment.volumes | object | `{"emptyDir":[],"fromConfigMaps":[],"fromPvc":[],"fromSecrets":[]}` | Volume parameters for deployment (Required). |
| deployment.volumes.emptyDir | list | `[]` | Enables you to create an empty directory inside the deployment's pod (Useful for temporary storage) (Optional). Note: All the content inside the empty directory will be delete incase of a pod deletion. |
| deployment.volumes.fromConfigMaps | list | `[]` | Volumes from ConfigMaps (Optional). Enables you to pull existing ConfigMaps into a volume. |
| deployment.volumes.fromPvc | list | `[]` | Volumes from Persistent Volume Claims (PVC) (Optional). Enables you to use existing PVCs. |
| deployment.volumes.fromSecrets | list | `[]` | Volumes from secrets (Optional). Enables you to pull existing secrets into a volume. |
| ingress.enabled | bool | `false` | Whether to enable the creation of ingresses (Required). |
| ingress.ingresses | list | `[{"annotations":{},"hosts":null,"ingressClassName":null,"labels":{},"name":"","tls":[]}]` | List of Ingresses (Required). |
| ingress.ingresses[0] | object | `{"annotations":{},"hosts":null,"ingressClassName":null,"labels":{},"name":"","tls":[]}` | Name of Ingress (Required). |
| ingress.ingresses[0].annotations | object | `{}` | Add annotations to Ingress (Required). |
| ingress.ingresses[0].hosts | string | `nil` | List of hosts and paths options inside an Ingress (Required) |
| ingress.ingresses[0].ingressClassName | string | `nil` | ingressClassName of Ingress (Required). |
| ingress.ingresses[0].labels | object | `{}` | Add labels to Ingress (Optional). |
| ingress.ingresses[0].tls | list | `[]` | List of tls (Optional). Use TLS for the ingress to get HTTPS. |
| job.affinity | object | `{"nodeAffinity":{"enabled":false,"labelKey":"nodeGroup","labelValue":"basic"},"podSelfAntiAffinity":{"enabled":true}}` | Affinity parameters for scheduling the job (Optional). |
| job.affinity.nodeAffinity | object | `{"enabled":false,"labelKey":"nodeGroup","labelValue":"basic"}` | Schedule job's pod only on a specific node (Required). |
| job.affinity.nodeAffinity.labelKey | string | `"nodeGroup"` | Add node's label key (Required). |
| job.affinity.nodeAffinity.labelValue | string | `"basic"` | Add node's label value (Required). |
| job.affinity.podSelfAntiAffinity | object | `{"enabled":true}` | Enables you to prevent pods with specific labels or attributes from running together on the same node to enhance resilience and availability (Required). |
| job.args | list | `[]` | Additional arguments to pass to the container's main command (Optional). Note: The args field does not replace the main command; it augments it. |
| job.backoffLimit | int | `2` | Job backoffLimit, valid values: Integer. (Optinal) |
| job.command | list | `[]` | List of commands that replace the default command defined in the container image's Dockerfile (Optional). |
| job.containerSecurityContext | object | `{}` | Security context for containers inside job's pod (Required). |
| job.enabled | bool | `false` | Whether to create the job (Required). |
| job.env | object | `{"fromConfigMaps":[],"fromSecrets":[],"regular":{}}` | Environment Variables parameters for job (Required). |
| job.env.fromConfigMaps | list | `[]` | Environment Variables from ConfigMaps (Optional). |
| job.env.fromSecrets | list | `[]` | Environment Variables from secrets (Optional). Enables you to create environment variables from existing secrets. |
| job.env.regular | object | `{}` | Create Environment Variables (Optional). Create environment variables manually using key-value pairs. |
| job.image | object | `{"dockerregistry":"","name":"","pullPolicy":"","tag":""}` | Specify details of the job's image (Required). |
| job.image.dockerregistry | string | `""` | The Docker registry URL (Required). Note: If the Docker registry is private, you might need to use imagePullSecrets. |
| job.image.name | string | `""` | The Docker image name (Required). Note: No need to add '/' at the beginning. |
| job.image.pullPolicy | string | `""` | Pull policy for pod restarts (Required). |
| job.image.tag | string | `""` | The Docker image tag (Required). |
| job.imagePullSecrets | list | `[]` | Use a secret that contains private Docker registry credentials (Optional). |
| job.labels | object | `{}` | Add labels to job (Optional). |
| job.name | string | `""` | job name (Required). |
| job.nodeSelector | object | `{}` | Add node labels to schedule job on specific nodes (Optional). |
| job.podAnnotations | object | `{}` | Add annotations directly to job's pod (Optional). |
| job.podSecurityContext | object | `{}` | job pod's security context (Required). |
| job.resources | object | `{}` | Resource requests and limits for job's pods (Required). Note: .job.resources.limits & .job.resources.requests are optional. |
| job.restartPolicy | string | `"Never"` | Job restartPolicy, valid values: "OnFailure", "Never". (Required). |
| job.tolerations | list | `[]` | Add tolerations to schedule job on specific nodes (Optional). |
| job.volumes | object | `{"emptyDir":[],"fromConfigMaps":[],"fromPvc":[],"fromSecrets":[]}` | Volume parameters for job (Required). |
| job.volumes.emptyDir | list | `[]` | Enables you to create an empty directory inside the job's pod (Useful for temporary storage) (Optional). Note: All the content inside the empty directory will be delete incase of a pod deletion. |
| job.volumes.fromConfigMaps | list | `[]` | Volumes from ConfigMaps (Optional). Enables you to pull existing ConfigMaps into a volume. |
| job.volumes.fromPvc | list | `[]` | Volumes from Persistent Volume Claims (PVC) (Optional). Enables you to use existing PVCs. |
| job.volumes.fromSecrets | list | `[]` | Volumes from secrets (Optional). Enables you to pull existing secrets into a volume. |
| networkpolicy.annotations | object | `{}` | Add annotations to NetworkPolicy (Required). |
| networkpolicy.egress | string | `nil` | NetworkPolicy egress list. |
| networkpolicy.enabled | bool | `false` | Whether to enable the creation of networkpolicy (Required). |
| networkpolicy.ingress | string | `nil` | NetworkPolicy ingress list. |
| networkpolicy.labels | object | `{}` | Add labels to NetworkPolicy (Optional). |
| networkpolicy.name | string | `""` | Name of NetworkPolicy (Required). |
| networkpolicy.policyTypes | list | `[]` | NetworkPolicy policy types (Required) ("Ingress"/"Egress"). |
| networkpolicy.selectDeployment | bool | `true` | Connect networkpolicy to deployment (Optional). Note: Will use .deployment.labels in the selector field in the NetworkPolicy, will apply only if .networkpolicy.selectDeployment, .deployment.enabled are true |
| networkpolicy.selector | object | `{}` | Add labels of a pod (Optional). Note: Will not apply if .networkpolicy.selectDeployment, .deployment.enabled are true |
| pvc.enabled | bool | `false` | Whether to create the Persistent Volume Claim (PVC) (Required). |
| pvc.pvc[0].accessModes | list | `[]` | accessModes of PVC (Required). |
| pvc.pvc[0].name | string | `""` |  |
| pvc.pvc[0].storage | string | `"2Gi"` | Storage size of PVC (Required). |
| pvc.pvc[0].storageClassName | string | `"default"` | storageClassName of PVC (Required). |
| pvc.pvc[0].volumeMode | string | `"Filesystem"` | volumeMode of PVC (Required). |
| secrets.enabled | bool | `false` | Whether to enable the creation of secrets (Required). |
| secrets.secrets | string | `nil` | List of secrets (Required). |
| service.enabled | bool | `false` | Whether to enable the creation of services (Required). |
| service.services | list | `[{"annotations":{},"enableProbePort":true,"labels":{},"name":"","ports":[{"name":"service-port","port":8065,"protocol":"TCP","targetPort":8065}],"selectDeployment":true,"selector":{},"type":"ClusterIP"}]` | List of services (Required). |
| service.services[0] | object | `{"annotations":{},"enableProbePort":true,"labels":{},"name":"","ports":[{"name":"service-port","port":8065,"protocol":"TCP","targetPort":8065}],"selectDeployment":true,"selector":{},"type":"ClusterIP"}` | Name of a service to create (Required). |
| service.services[0].annotations | object | `{}` | Add annotations to the Service (Optional). |
| service.services[0].enableProbePort | bool | `true` | Open readiness probePort using the port specified in .deployment.readiness.probePort (Required). Note: Will apply only if these values are true - .service.services[].type, .deployment.enabled, .deployment.readiness.openServicePort |
| service.services[0].labels | object | `{}` | Add labels to the Service (Optional). |
| service.services[0].ports | list | `[{"name":"service-port","port":8065,"protocol":"TCP","targetPort":8065}]` | Ports list to open in the Service (Required). |
| service.services[0].ports[0] | object | `{"name":"service-port","port":8065,"protocol":"TCP","targetPort":8065}` | Name of port in the Service (Required). |
| service.services[0].ports[0].port | int | `8065` | Port number in the Service (Required). |
| service.services[0].ports[0].protocol | string | `"TCP"` | Protocol of port in the Service (Required). |
| service.services[0].ports[0].targetPort | int | `8065` | Target port number in the Service (Required). |
| service.services[0].selectDeployment | bool | `true` | Connect service to deployment (Optional). Note: Will use .deployment.labels in the selector field in the Service, will apply only if .service.services[].selectDeployment, .deployment.enabled are true |
| service.services[0].type | string | `"ClusterIP"` | The Service type (Required). |
| serviceAccount.annotations | object | `{}` | Add annotations to serviceAccount (Required). |
| serviceAccount.enabled | bool | `false` | Whether to create the serviceAccount (Required). |
| serviceAccount.name | string | `""` | ServiceAccount name (Required). |
| storageClass.allowVolumeExpansion | bool | `true` | allowVolumeExpansion of StorageClass (Required). |
| storageClass.enabled | bool | `false` | Whether to create the StorageClass (Required). |
| storageClass.mountOptions | list | `[]` | mountOptions of StorageClass (Required). |
| storageClass.name | string | `""` | Name of StorageClass to create (Required). |
| storageClass.provisioner | string | `"file.csi.azure.com"` | provisioner of StorageClass (Required). |
| storageClass.reclaimPolicy | string | `"Delete"` | reclaimPolicy of StorageClass (Required). |
| storageClass.skuName | string | `"Standard_LRS"` | skuName of StorageClass (Required). |
| storageClass.volumeBindingMode | string | `"Immediate"` | volumeBindingMode of StorageClass (Required). |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
