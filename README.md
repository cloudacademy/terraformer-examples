
## Installing Terraformer

* Linux
```
export PROVIDER={all,google,aws,kubernetes}
curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64
chmod +x terraformer-${PROVIDER}-linux-amd64
sudo mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer
```
* MacOS
```
export PROVIDER={all,google,aws,kubernetes}
curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-darwin-amd64
chmod +x terraformer-${PROVIDER}-darwin-amd64
sudo mv terraformer-${PROVIDER}-darwin-amd64 /usr/local/bin/terraformer
```

## Using a package manager

- [Homebrew](https://brew.sh/) users can use `brew install terraformer`.
- [Chocolatey](https://chocolatey.org/) users can use `choco install terraformer`.

## Installing Other Binaries Used

### Terraform

* Terraform_0.12.29
```
https://releases.hashicorp.com/terraform/0.12.29/
```

### Plugin

* Provider 

Replace the init.tf provider with your declared Cloud Provider and run the following command
in the directory with init.tf

```
terraform init
```

#

# What happens after terraformer is ran?

Files are generated in the current directory with the following folder structure:

```
generated / {RPROVIDER} / {PROJECT} / {RESOURCE} / {REGION/GLOBAL}
```

## What's generated?

**Always**
- provider.tf
- terraform.tfstate

**When terraformer finds resources**
- Name of corresponding resource in provider
-- Unless Compact is used
- Outputs for the found resource during invokation


### Terraformer Examples Used in Course

```
terraformer import google --resources=instances --projects=cloudacademyprod --regions=us-central1
```

```
terraformer import google --resources=addresses,autoscalers,backendBuckets,backendServices,bigQuery,cloudFunctions,cloudsql,dataProc,disks,externalVpnGateways,dns,firewall,forwardingRules,gcs,gke,globalAddresses,globalForwardingRules,healthChecks,httpHealthChecks,httpsHealthChecks,iam,images,instanceGroupManagers,instanceGroups,instanceTemplates,instances,interconnectedAttachments,kms,logging,memoryStore,monitoring,networks,packetMirrorings,nodeGroups,nodeTemplates,project,pubsub,regionAutoscalers,regionBackendServices,regionDisks,regionHealthChecks,regionInstanceGroups,regionSslCertificates,regionTargetHttpProxies,regionTargetHttpsProxies,regionUrlMaps,reservations,resourcePolicies,regionInstanceGroupManagers,routers,routes,schedulerJobs,securityPolicies,sslCertificates,sslPolicies,subnetworks,targetHttpProxies,targetHttpsProxies,targetInstances, targetPools,targetSslProxies,targetTcpProxies,targetVpnGateways,urlMaps,vpnTunnels --projects=cloudacademyprod --regions=us-central1
```

```
terraformer plan google --resources=instances --projects=cloudacademyprod --regions=us-central1
```

```
terraformer import plan {PATH}/{TO}/plan.json
```

