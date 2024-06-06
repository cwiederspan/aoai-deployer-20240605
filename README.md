# aoai-deployer-20240605
A method of deploying Azure OpenAI across multiple subscriptions and regions via automation.

```bash


az bicep upgrade -t linux-x64

az login

BASENAME=cdw-aiservices-20240605
LOCATION=swedencentral

az deployment sub create \
--name aoia \
--template-file ./infra/main.bicep \
--location $LOCATION \
--parameters \
  aoaiBaseName=$BASENAME


az deployment sub delete --name aoia 

az group delete -n $BASENAME --yes

```