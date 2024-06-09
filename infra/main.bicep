targetScope = 'subscription'

param baseName string

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

module aoai './modules/aoai.bicep' = {
  name: 'aoai'
  scope: rg
  params: {
    baseName: '${baseName}-${rg.location}'
    location: rg.location
    workspaceId: monitor.outputs.workspaceId
  }
}
