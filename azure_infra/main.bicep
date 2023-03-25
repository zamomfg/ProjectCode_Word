
param environment string = 'prod'
param location string = 'northeurope'
var webAppName = 'CodeGenerator'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${webAppName}-${environment}-${location}'
  location: location
}

module app_service './app_service.bicep' = {
  name: 'app'
  scope: resourceGroup
  params: {
    webAppName: webAppName
    location: location
  }
}
