# AZ-204 - Azure Developer

Este projeto contém exemplos e exercícios para preparação da certificação AZ-204.

## Estrutura do Projeto

```
az204/
├── EntraID/              # Integração com Azure Entra ID
├── README.md             # Este arquivo
```

## Function Apps

```bash
func new --template "HTTP trigger" --name auth_storage --csx
```

```bash
az functionapp identity assign --name "pedrifunction" --resource-group "main-testing"
```
```
az role assignment create \
  --assignee-object-id "373fce5d-8eeb-4696-b104-e828b790349f" \
  --assignee-principal-type ServicePrincipal \
  --role "Storage Blob Data Contributor" \
  --scope "$STORAGE_SCOPE"
```
```
az functionapp identity show --name pedrifunction --resource-group main-testing
```
## Storage
```
az storage account update \
  --name "$STORAGE_NAME" \
  --resource-group "$STORAGE_RG" \
  --allow-shared-key-access false
```

## EntraID

Scripts para gerenciamento de usuários e grupos no Azure Entra ID.

- `create-application-for-id.sh`: Cria uma aplicação no Entra ID
- `create-usergroup.sh`: Cria grupos de usuários
- `delete-user.sh`: Remove usuários
- `gen-user.sh`: Gera usuários
- `show-user.sh`: Exibe informações de usuários
