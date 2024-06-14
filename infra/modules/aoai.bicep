param baseName string
param region object
param workspaceId string

resource azureopenai 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: '${baseName}-${region.location}-aoai'
  location: region.location
  kind: 'OpenAI'
  sku: {
    name: 'S0'    // Could be parameterized, but it's currently the only allowable value here
  }
  properties: {
    customSubDomainName: '${baseName}-${region.location}-aoai'
    publicNetworkAccess: 'Enabled'
  }
}

resource model 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in region.deployments: {
  parent: azureopenai
  name: deployment.name
  sku: {
    name: 'Standard'
    capacity: deployment.capacity
    // family: 'string'
    // size: 'string'
    // tier: 'string'
  }
  properties: {
    model: {
      format: 'OpenAI'
      name: deployment.family
      version: deployment.version
    }
    raiPolicyName: 'Microsoft.Default'
    versionUpgradeOption: deployment.upgradeOption
    // scaleSettings: {
    //   capacity: int
    //   scaleType: 'string'
    // }
  }
}]

resource diagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'aoia-diagnostics'
  scope: azureopenai
  properties: {
    workspaceId: workspaceId
    logs: [
      {
        categoryGroup: 'allLogs'
        enabled: true
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
        // timeGrain: 'PT1M'
      }
    ]
  }
}
