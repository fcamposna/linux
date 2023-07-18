# Agregar aquí el secreto y el identificador de la aplicación de la entidad de servicio
servicePrincipalClientId="271f532c-7f70-43c6-8033-d5577f369253";
servicePrincipalSecret="9pC8Q~mPIYJ7Oyb2wg~N3EfGBHjmF9P5lEWRFbfy";


export subscriptionId="4a606bd4-157b-4249-a54b-5dfbce20eb19";
export resourceGroup="KeyVault-CTTI";
export tenantId="3bbae254-dd01-4d4b-97b2-c79a2e78fd24";
export location="westeurope";
export authType="principal";
export correlationId="04c8ca81-ba32-41f5-babd-ea29273d1c0d";
export cloud="AzureCloud";


# Descargar el paquete de instalación
output=$(wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh 2>&1);
if [ $? != 0 ]; then wget -qO- --method=PUT --body-data="{\"subscriptionId\":\"$subscriptionId\",\"resourceGroup\":\"$resourceGroup\",\"tenantId\":\"$tenantId\",\"location\":\"$location\",\"correlationId\":\"$correlationId\",\"authType\":\"$authType\",\"operation\":\"onboarding\",\"messageType\":\"DownloadScriptFailed\",\"message\":\"$output\"}" "https://gbl.his.arc.azure.com/log" &> /dev/null || true; fi;
echo "$output";

# Instalar el agente híbrido
bash ~/install_linux_azcmagent.sh;

# Ejecutar comando de conexión
sudo azcmagent connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "$resourceGroup" --tenant-id "$tenantId" --location "$location" --subscription-id "$subscriptionId" --cloud "$cloud" --correlation-id "$correlationId";
