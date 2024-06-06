# aoai-deployer-20240605
A method of deploying Azure OpenAI across multiple subscriptions and regions via automation.

```bash

az bicep upgrade -t linux-x64

az login

az deployment sub create \
--name aoia \
--template-file ./infra/main.bicep \
--location eastus2 \
--parameters \
  aoaiBaseName='cdw-aiservices-20240605'


az deployment sub delete --name aoia 

az group delete -n cdw-aiservices-20240605

```