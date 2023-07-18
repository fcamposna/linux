az connectedmachine extension create --resource-group "KeyVault-CTTI" --machine-name "vm-lin-ctti" --location "westeurope" --publisher "Microsoft.Azure.KeyVault" --type "KeyVaultForLinux" --name "KeyVaultForLinux" --settings '{"secretsManagementSettings": { "pollingIntervalInS": "60", "certificateStoreName": "/home/fcampos/", "certificateStoreLocation": "LocalMachine", "observedCertificates": ["https://key-ctti.vault.azure.net/secrets/cert-1"] }, "authenticationSettings": {"msiEndpoint": "http://localhost:40342/metadata/identity" }}'
