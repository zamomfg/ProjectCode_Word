param webAppName string
param location string
param locationName string
param environment string
var sku = 'F1' // F1 Free plam https://azure.microsoft.com/en-us/pricing/details/app-service/linux/
var linuxFxVersion = 'PYTHON|3.7"' // The runtime stack of web app
var webSiteName = toLower('wapp-${webAppName}-${environment}-${locationName}')
var appServicePlanName = toLower('AppServicePlan-${webAppName}-${environment}-${locationName}')


resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
