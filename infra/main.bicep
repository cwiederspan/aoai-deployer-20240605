targetScope = 'subscription'

@description('The base naming scheme for all resources being created.')
param baseName string

@description('A list of Azure regions to deploy the AI resources to.')
param configurations array = []

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: baseName
  location: deployment().location
}

module monitor './modules/monitoring.bicep' = {
  name: 'monitor'
  scope: rg
  params: {
    baseName: baseName
    location: rg.location
  }
}

module aoai './modules/aoai.bicep' = [for config in configurations: {
  name: 'aoai-${config.region}'
  scope: rg
  params: {
    baseName: baseName
    configuration: config
    workspaceId: monitor.outputs.workspaceId
  }
}]
