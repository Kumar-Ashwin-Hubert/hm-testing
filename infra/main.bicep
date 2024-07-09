targetScope = 'subscription'

param environment string

param location string

param createManagementResourceGroup bool

var defaultTags = {
  environment: environment
}

resource coreResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-dtm-core-${environment}'
  location: location
  tags: defaultTags
}

resource jobManagerResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-dtm-jobmanager-${environment}'
  location: location
  tags: defaultTags
}

resource managementResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = if (createManagementResourceGroup) {
  name: 'rg-dtm-mgmt-${environment}'
  location: location
  tags: defaultTags
}

module import_acr_image 'import-image.bicep' = {
  name: 'Import-Hello-World-Image-to-ACR'
  scope: resourceGroup(jobManagerResourceGroup.name)
  params: {
    location: location
  }
}
