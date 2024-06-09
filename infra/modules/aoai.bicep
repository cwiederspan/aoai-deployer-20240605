param baseName string
param location string
param workspaceId string

resource azureopenai 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: '${baseName}-aoai'
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'    // Could be parameterized, but it's currently the only allowable value here
  }
  properties: {
    customSubDomainName: '${baseName}-aoai'
    publicNetworkAccess: 'Enabled'
  }
}

resource model 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: azureopenai
  name: 'gpt-4-turbo'
  sku: {
    name: 'Standard'
    capacity: 150
    // family: 'string'
    // size: 'string'
    // tier: 'string'
  }
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4'
      version: 'turbo-2024-04-09'
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
