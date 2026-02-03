# Arquitetura da Plataforma

## Diagrama textual

```
                        +-----------------------------+
                        |      GitHub Actions         |
                        |  CI / CD / Preview Deploy   |
                        +---------------+-------------+
                                        |
                                        v
                               +--------+---------+
                               | Azure Resource   |
                               | Group (por env)  |
                               +--------+---------+
                                        |
       +--------------------+-----------+-----------+--------------------+
       |                    |                       |                    |
       v                    v                       v                    v
 +-------------+   +-------------------+   +-------------------+   +--------------+
 |   VNet      |   |   App Service     |   |  PostgreSQL       |   | Storage / LA |
 | subnets     |   | Backend & Frontend|   | Flexible Server   |   | Logs/Artifacts|
 +------+------+   +---------+---------+   +---------+---------+   +------+-------+
        |                    |                       |                    |
        | VNet Integration   | Managed Identity      | Private DNS         |
        v                    v                       v                    v
  +-------------+   +-------------------+   +-------------------+   +--------------+
  | Subnet App  |   | Key Vault Secrets |   | Private Access    |   | Log Analytics|
  | (frontend)  |   | (conn string)     |   | (no public IP)    |   | Workspace    |
  +-------------+   +-------------------+   +-------------------+   +--------------+
```

## Fluxo CI/CD

### CI
1. `terraform fmt` e `terraform validate` para dev, prod e preview.
2. Build/test backend e frontend (quando diretórios existem).

### CD Dev / Prod
1. `terraform init/plan/apply` com state remoto em Storage Account.
2. Build e push da imagem do backend para o ACR.
3. Execução de migrations antes do deploy.
4. Deploy do backend via App Service (container).
5. Build e deploy do frontend.

### Preview Environments
1. PR em `feature/*` dispara `terraform apply` com `environment=pr-<id>`.
2. Recursos isolados por PR (`devops-platform-pr-<id>-*`).
3. Ao fechar o PR, `terraform destroy` remove todos os recursos.

## Recursos principais por ambiente

- **Networking**: VNet dedicada com subnets separadas para frontend, backend e banco.
- **Backend/Frontend**: App Services Linux com integração VNet.
- **Database**: PostgreSQL Flexible Server com acesso privado e Private DNS.
- **Key Vault**: Secrets (connection string) expostos via Managed Identity.
- **Storage**: Logs e assets estáticos com lifecycle policy.
- **Observabilidade**: Log Analytics Workspace com logs de App Service.

## Observações importantes

- **Segurança**: banco sem IP público e secrets apenas via Key Vault.
- **Naming**: `{project}-{environment}-{resource}`.
- **Preview**: recursos efêmeros com teardown automático após merge/close.
