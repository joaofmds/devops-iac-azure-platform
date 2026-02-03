# Desafio Técnico: Engenharia DevOps & Infraestrutura como Código

## Objetivo Geral

O candidato deverá provisionar uma infraestrutura escalável, segura e automatizada utilizando IaC (Terraform e GitHub Actions), garantindo a segregação de ambientes e a automação completa do deploy, desde a base de dados até o front-end.

## 1. Requisitos de Infraestrutura (IaC)

Toda a infraestrutura deve ser provisionada via código:

- **Networking**: Configuração de uma VNet com subnets distintas. O Backend deve ser acessível pelo Frontend de forma segura (integração de rede).
- **PaaS (App Services/Container Apps)**: Um serviço para a API (Node.js/Python) e outro para o Frontend (React/Next.js).
- **Database**: Instância de PostgreSQL ou SQL Server provisionada de forma privada na rede.
- **Storage Account**: Criação de um storage para armazenamento de arquivos estáticos e retenção de logs.

## 2. Repositórios e CI/CD

Você deve organizar a estrutura de pastas ou repositórios para suportar:

- **Migrations**: Repositório/Diretório específico para scripts de banco de dados. O pipeline deve executar as migrations automaticamente antes do deploy da API.
- **Multi-Ambiente**: Configuração de ambientes de Dev e Prod utilizando variáveis de ambiente e secrets distintas.
- **GitHub Actions**:
  - Pipeline de CI (Build e Testes).
  - Pipeline de CD (Provisionamento de IaC e Deploy das aplicações).

## 3. O Diferencial: Ambientes Efêmeros (Preview Environments)

O ponto alto do teste é a implementação de um fluxo de Feature Branch:

- Ao abrir um Pull Request para uma branch específica (ex: `feature/*`), o pipeline deve subir uma stack completa e isolada para teste.
- Após o merge ou fechamento do PR, um workflow deve ser engatilhado para destruir todos os recursos desse ambiente temporário, visando a economia de custos.

## Critérios de Avaliação

| Critério | O que observaremos |
|----------|-------------------|
| **Segurança** | Uso de Managed Identities (opcional), VNet Integration e proteção de Secrets. |
| **Idempotência** | Se o código de IaC pode ser executado várias vezes sem erros. |
| **Observabilidade** | Configuração básica de logs e envio para o Storage/Log Analytics. |
| **Estratégia de Branching** | Organização do Gitflow ou GitHub Flow. |
| **Limpeza** | A capacidade de destruir o ambiente efêmero sem deixar "lixo" na cloud. |

---

> **Nota**: Você pode utilizar conta gratuita na Microsoft Azure e no Github para a execução do teste.


---

