param name string
param location string

resource cognitiveService 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'    // Could be parameterized, but it's currently the only allowable value here
  }
  properties: {
    customSubDomainName: name
    publicNetworkAccess: 'Enabled'
  }
}

/*
resource model 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: cognitiveService
  name: 'gpt-4-turbo'
  sku: {
    capacity: int
    family: 'string'
    name: 'string'
    size: 'string'
    tier: 'string'
  }
  properties: {
    model: {
      format: 'OpenAI'
      name: 'string'
      source: 'string'
      version: 'string'
    }
    raiPolicyName: 'string'
    scaleSettings: {
      capacity: int
      scaleType: 'string'
    }
    versionUpgradeOption: 'string'
  }
}
*/
