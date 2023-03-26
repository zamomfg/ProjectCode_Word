
param environment string = 'prod'
param location string
param locationName string
var webAppName = 'CodeGenerator'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${webAppName}-${environment}-${locationName}'
  location: location
}

module app_service './app_service.bicep' = {
  name: 'app'
  scope: az.resourceGroup(resourceGroup.name)
  params: {
    webAppName: webAppName
    location: location
    locationName: locationName
    environment: environment
  }
}
