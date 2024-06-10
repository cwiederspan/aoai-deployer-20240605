param baseName string
param configuration object
param workspaceId string

resource azureopenai 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: '${baseName}-${configuration.region}-aoai'
  location: configuration.region
  kind: 'OpenAI'
  sku: {
    name: 'S0'    // Could be parameterized, but it's currently the only allowable value here
  }
  properties: {
    customSubDomainName: '${baseName}-${configuration.region}-aoai'
    publicNetworkAccess: 'Enabled'
  }
}

resource model 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: azureopenai
  name: configuration.name
  sku: {
    name: 'Standard'
    capacity: configuration.capacity
    // family: 'string'
    // size: 'string'
    // tier: 'string'
  }
  properties: {
    model: {
      format: 'OpenAI'
      name: configuration.family
      version: configuration.version
    }
    raiPolicyName: 'Microsoft.Default'
    versionUpgradeOption: 'OnceCurrentVersionExpired'
    // scaleSettings: {
    //   capacity: int
    //   scaleType: 'string'
    // }
  }
}

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
