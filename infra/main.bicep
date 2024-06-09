targetScope = 'subscription'

@description('The base naming scheme for all resources being created.')
param baseName string

@description('A list of Azure regions to deploy the AI resources to.')
param aiLocations array = []

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

module aoai './modules/aoai.bicep' = [for loc in aiLocations: {
  name: 'aoai-${loc}'
  scope: rg
  params: {
    baseName: '${baseName}-${loc}'
    location: loc
    workspaceId: monitor.outputs.workspaceId
  }
}]
