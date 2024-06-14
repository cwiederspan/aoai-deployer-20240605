using './main.bicep'

param baseName = ''

param regions = [

  // *** Regions that already have GPT-4-Turbo-20240409 ***
  
  {
    location: 'eastus2'
    deployments: [
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: 'turbo-2024-04-09'
        capacity: 80
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'swedencentral'
    deployments: [
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: 'turbo-2024-04-09'
        capacity: 150
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }

  // *** Regions that only have GPT-4-1106-Preview *** //
  /*
  {
    location: 'australiaeast'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'canadaeast'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'francecentral'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'norwayeast'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 75
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 75
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'southindia'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 75
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 75
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'westus'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'westus3'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }*/

  // *** Regions that only have GPT-4-0125-Preview *** //
  /*
  {
    location: 'eastus'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '0125-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'northcentralus'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '0125-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'southcentralus'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '0125-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  {
    location: 'uksouth'
    deployments: [
      {
        name: 'gpt-4-turbo-fixed'
        family: 'gpt-4'
        version: '1106-Preview'
        capacity: 40
        upgradeOption: 'NoAutoUpgrade'
      }
      {
        name: 'gpt-4-turbo-current'
        family: 'gpt-4'
        version: '0125-Preview'
        capacity: 40
        upgradeOption: 'OnceNewDefaultVersionAvailable'
      }
    ]
  }
  */
]
