# DevOps IaC Azure Platform

Este repositório implementa uma plataforma de referência **Azure + Terraform + GitHub Actions**, com ambientes **dev**, **prod** e **preview (efêmeros)**, seguindo boas práticas de segurança, observabilidade e governança.

## Estrutura

```
.
├── docs/
│   └── architecture.md
└── infra/
    └── terraform/
        ├── environments/
        │   ├── dev/
        │   ├── prod/
        │   └── preview/
        └── modules/
            ├── acr/
            ├── app-services/
            ├── database/
            ├── key-vault/
            ├── network/
            ├── platform/
            └── storage-account/
```

## Pré-requisitos

- Azure Subscription ativa
- GitHub repo com secrets configurados
- Terraform >= 1.5
- Azure CLI

## Secrets necessários no GitHub

> Use um Service Principal com acesso de Contributor ao RG de state e aos RGs dos ambientes.

- `AZURE_CREDENTIALS` (JSON do Service Principal)
- `TF_STATE_RG`
- `TF_STATE_STORAGE_ACCOUNT`
- `TF_STATE_CONTAINER`

Para deploys:
- `APP_RG_DEV`, `BACKEND_APP_NAME_DEV`, `FRONTEND_APP_NAME_DEV`, `ACR_NAME_DEV`
- `APP_RG_PROD`, `BACKEND_APP_NAME_PROD`, `FRONTEND_APP_NAME_PROD`, `ACR_NAME_PROD`

## Como rodar local (Terraform)

### Dev

```bash
cd infra/terraform/environments/dev
terraform init \
  -backend-config="resource_group_name=<rg>" \
  -backend-config="storage_account_name=<storage>" \
  -backend-config="container_name=<container>" \
  -backend-config="key=dev.tfstate"
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Prod

```bash
cd infra/terraform/environments/prod
terraform init \
  -backend-config="resource_group_name=<rg>" \
  -backend-config="storage_account_name=<storage>" \
  -backend-config="container_name=<container>" \
  -backend-config="key=prod.tfstate"
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Preview (por PR)

```bash
cd infra/terraform/environments/preview
terraform init \
  -backend-config="resource_group_name=<rg>" \
  -backend-config="storage_account_name=<storage>" \
  -backend-config="container_name=<container>" \
  -backend-config="key=preview/pr-123.tfstate"

terraform apply -var-file=terraform.tfvars \
  -var "environment=pr-123" \
  -var "storage_account_name=devopspr123sa" \
  -var "acr_name=devopspr123acr" \
  -var "key_vault_name=devopspr123kv" \
  -var "postgres_server_name=devopspr123pg"
```

## Como destruir ambientes

```bash
cd infra/terraform/environments/preview
terraform destroy -var-file=terraform.tfvars \
  -var "environment=pr-123" \
  -var "storage_account_name=devopspr123sa" \
  -var "acr_name=devopspr123acr" \
  -var "key_vault_name=devopspr123kv" \
  -var "postgres_server_name=devopspr123pg"
```

## CI/CD

- **CI**: validação do Terraform + build/test de aplicações (se existirem diretórios `backend/` e `frontend/`).
- **CD Dev/Prod**: Terraform apply + build/push imagens + deploy.
- **Preview**: cria/destrói ambientes efêmeros ao abrir/fechar PRs em `feature/*`.

## Segurança

- Banco de dados privado (sem IP público).
- Secrets centralizados no Key Vault.
- Managed Identity nos App Services para leitura dos secrets.

## Observabilidade

- Log Analytics Workspace por ambiente.
- Logs básicos de App Service enviados ao workspace.

Veja o detalhamento completo em [`docs/architecture.md`](docs/architecture.md).
