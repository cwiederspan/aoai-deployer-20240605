# Azure OpenAI Deployment

An example of deploying Azure OpenAI across multiple subscriptions and regions via automation.

```bash

az bicep upgrade -t linux-x64

az login

BASENAME=cdw-aiservices-20240614
LOCATION=eastus2

az deployment sub create \
--name aoia \
--location $LOCATION \
--parameters baseName=$BASENAME \
--parameters ./infra/config.bicepparam

az deployment sub delete --name aoia 

az group delete -n $BASENAME --yes

```