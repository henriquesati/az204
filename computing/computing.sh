az containerapp create \
    --name gatinhos_app \
    --resource-group gatinhos_rg \
    --image gatinhos_acr/gatinhos:v1 \
    --registry-server gatinhos_acr.azurecr.io \
    --registry-username <user> \
    --registry-password <password> \
    --location brasil_gatinhos \
    --target-port 80 \
    --ingress external \
    --environment gatinhos_env \
    --cpu 1 \
    --memory 2

az containerapp revision activate


    az containerapp ingress traffic set 
    --name gatinhos_containers
    --resource-group rg 
    --revision-weight 0:100

(
    --revision-weight 
    latest=80 
gatinhos_containers--old_gatinhos=20,
--label-weight \
)

az container app revision deactivate
--name gatinho_contianers
--resource-group rg
--revision old_gatinhos

<------------------------------------------------------------------------------------->

az containerapp job create \
 --name gatinhos_job
 --resource-group rg
----enviroment gattinhos_env
--trigger-type Manual


az containerapp job create \
    --name queue-job \
    --resource-group rg \
    --environment env \
    --trigger-type Event \
    --image meuacr.azurecr.io/worker:v1 \
    --scale-rule-name queue-rule \
    --scale-rule-type azure-queue \
    --scale-rule-metadata \
        accountName=mystorage \
        queueName=orders \
        queueLength=10 \
    --scale-rule-auth \
        connection=storage-connection-secret

az containerapp job create \
    --name sb-queue-job \
    --resource-group rg \
    --environment env \
    --trigger-type Event \
    --image meuacr.azurecr.io/worker:v1 \
    --scale-rule-name sb-rule \
    --scale-rule-type azure-servicebus \
    --scale-rule-metadata \
        namespace=meusb \
        queueName=orders \
        messageCount=5 \
    --scale-rule-auth \
        connection=servicebus-secret



az containerapp job create \
    --name sb-job \
    --resource-group rg \
    --environment env \
    --image meuacr.azurecr.io/worker:v1 \
    --trigger-type Event \
    --user-assigned "/subscriptions/.../resourceGroups/rg/
    providers/Microsoft.ManagedIdentity/
    userAssignedIdentities/job-mi"


<------------------------------------------------------------------------------------->

az containerapp update \
    --name orders-api \
    --resource-group rg \
    --min-replicas 0 \
    --max-replicas 15 \
    --scale-rule-name sb-rule \
    --scale-rule-type azure-servicebus \
    --scale-rule-metadata \
        queueName=orders \
        namespace=orders-ns \
        messageCount=20 \
    --scale-rule-auth \
        connection=sb-connection

az containerapp secret set \
    --name inventory-api \
    --resource-group rg-prod \
    --secrets \
    db-password=
    keyvaultref:https://kv-prod.vault.azure.net/secrets/DbPassword,
    identityref:system
    (se for user, identityref:/subscriptions/.../userAssignedIdentities/minha-mi)