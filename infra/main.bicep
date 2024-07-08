targetScope = 'subscription'

param environment string

param location string

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
