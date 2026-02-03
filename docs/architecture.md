# Arquitetura:

## Infraestrutura Terraform

Padronização de nomes recursos por ambiente: `{project-name}-{resource}-{env}`
Ex: `tech-database-prod`

### Networking
- VNET por ambiente
  - vnet-dev
  - vnet-prod
  - vnet-pr-<id>

- Subnets
  - subnet-frontend
  - subnet-backend
  - subnet-database

### Backend
- Azure App Services
- Runtime
  - Node.js 22

### Frontend
- Azure App Services
- Runtime:
  - React
- Comunicação com backend via subnet

### Database
- Azure Database for PostgreSQL
- Sem IP público
- Backup automático
- Private Endpoint

### Storage Account
- logs/
- static/

### Observabilidade
- Log Analytics Workspace
- Logs coletados de:
  - App Services
  - Database (PostgreSQL)

## CI/CD

### Ferramenta
- Github Actions

### Estratégia de branches
- Gitflow

### CI - Build & Test
- backend build & test
- frontend build & test
- lint


### CD - Deploy Dev / Prod
- Trigger: 
  - main -> prod
  - develop -> dev
- Fluxo:
  - Terraform apply (pasta infra)
  - Criar a imagem Docker da aplicação
  - Enviar imagem para ACR
  - database migrations
  - deploy frontend
  - deploy backend

### CD - Deploy feature/
- Trigger:
  - pull_request em `feature/*`
- Ao abrir PR:
  - Stack:
    - vnet-pr-123
    - app-backend-pr-123
    - app-frontend-pr-123
    - database-pr-123
- Ao fechar PR:
  - terraform destroy

## Segurança

### Managed Identities
- Acesso ao banco de dados via backend

### VNet Integration 
- Database privado 

### Secrets
- Github Secrets
- Variáveis por ambientes
- Sem crendenciais hardcoded


---

Organizar por domínios dentro de ambientes