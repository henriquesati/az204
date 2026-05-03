# AZ-204 - Azure Developer

Este projeto contém exemplos e exercícios para preparação da certificação AZ-204.

## Estrutura do Projeto

```
az204/
├── EntraID/              # Integração com Azure Entra ID
├── README.md             # Este arquivo
```

## Function Apps

Para criar uma nova função HTTP trigger com C#:

```bash
func new --template "HTTP trigger" --name auth_storage --csx
```
### Function App

Gerenciamento da aplicação Function App no Azure.

**Atribuir Managed Identity:**
```bash
az functionapp identity assign --name "pedrifunction" --resource-group "main-testing"
```

Permite que a Function App use uma identidade gerenciada para autenticação segura.

## EntraID

Scripts para gerenciamento de usuários e grupos no Azure Entra ID.

- `create-application-for-id.sh`: Cria uma aplicação no Entra ID
- `create-usergroup.sh`: Cria grupos de usuários
- `delete-user.sh`: Remove usuários
- `gen-user.sh`: Gera usuários
- `show-user.sh`: Exibe informações de usuários
