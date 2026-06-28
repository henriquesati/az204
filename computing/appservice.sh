az webapp deployment slot <verbo>

az webapp deployment slot create \
    --resource-group rg \
    --name inventory-api \
    --slot staging

az webapp deployment slot create \
    --resource-group rg \
    --name inventory-api \
    --slot staging


az containerapp identity assign \
    --name minha-app \
    --resource-group rg \
    --system-assigned

Depois concede permissão no Key Vault.

Se estiver usando RBAC:

az role assignment create \
    --assignee <principal-id> \
    --role "Key Vault Secrets User" \
    --scope $(az keyvault show \
        --name gatinhos-kv \
        --query id -o tsv)