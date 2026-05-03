# AZ-204 - Azure Developer

Este projeto contém exemplos e exercícios para preparação da certificação AZ-204.

## Estrutura do Projeto

```
az204/
├── EntraID/              # Integração com Azure Entra ID
├── README.md             # Este arquivo
```

## Function Apps

### Overview
Azure Functions permite executar código serverless em resposta a eventos. Este projeto inclui exemplos de HTTP triggers e storage triggers.

### Criando uma nova Function App

Para criar uma nova função HTTP trigger com C#:

```bash
func new --template "HTTP trigger" --name auth_storage --csx
```

Este comando gera a estrutura necessária para uma função HTTP com suporte a C# script.

### Funções Disponíveis

- **helloworld**: Função HTTP básica que retorna uma saudação
- **auth_storage**: Função HTTP com suporte a JSON e tratamento de requisições POST/GET
- **Storaging**: Função de storage trigger

### Executando Localmente

Para testar as funções localmente:

```bash
func start
```

As funções estarão disponíveis em `http://localhost:7071/api/{nome-da-funcao}`

## EntraID

Scripts para gerenciamento de usuários e grupos no Azure Entra ID.

- `create-application-for-id.sh`: Cria uma aplicação no Entra ID
- `create-usergroup.sh`: Cria grupos de usuários
- `delete-user.sh`: Remove usuários
- `gen-user.sh`: Gera usuários
- `show-user.sh`: Exibe informações de usuários
