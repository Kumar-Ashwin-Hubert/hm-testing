param location string

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'importScript'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.20.0'
    timeout: 'PT30M'
    retentionInterval: 'P1D'
    scriptContent: 'az acr import --name testtodelete1234 --source docker.io/library/hello-world:latest --image hello-world:latest'
  }
}
