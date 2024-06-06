targetScope = 'subscription'

param aoaiBaseName string

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: aoaiBaseName
  location: deployment().location
}

module aoai './modules/aoai.bicep' = {
  name: 'aoai'
  scope: rg
  params: {
    name: '${aoaiBaseName}-${rg.location}-aoai'
    location: rg.location
  }
}
