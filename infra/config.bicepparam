using './main.bicep'

param baseName = ''

param configurations = [
  {
    region: 'eastus2'
    name: 'gpt-4-turbo'
    family: 'gpt-4'
    version: 'turbo-2024-04-09'
    capacity: 80
  }
  {
    region: 'swedencentral'
    name: 'gpt-4-turbo'
    family: 'gpt-4'
    version: 'turbo-2024-04-09'
    capacity: 150
  }
  {
    region: 'uksouth'
    name: 'gpt-4-preview'
    family: 'gpt-4'
    version: '0125-Preview'
    capacity: 80
  }
]
