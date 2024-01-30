// When you deploy a resource in Bicep, you can provide the if keyword followed by a condition. The condition should resolve to a Boolean (true or false) value. If the value is true, the resource is deployed. If the value is false, the resource is not deployed.

// It's common to create conditions based on the values of parameters that you provide. For example, the following code deploys a storage account only when the deployStorageAccount parameter is set to true:


param deployStorageAccount bool

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = if (deployStorageAccount) {
  name: 'teddybearstorage'
  location: resourceGroup().location
  kind: 'StorageV2'
  // ...
}

// In Bicep, conditions can also include expressions. In the following example, the code deploys a SQL auditing resource only when the environmentName parameter value is equal to Production:

@allowed([
  'Development'
  'Production'
])
param environmentName string

resource auditingSettings 'Microsoft.Sql/servers/auditingSettings@2021-11-01-preview' = if (environmentName == 'Production') {
  parent: server
  name: 'default'
  properties: {
  }
}

