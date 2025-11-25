# Future 2.0 Platform - Terraform Demo

Локальная демонстрация инфраструктуры платформы данных с использованием Terraform и Docker.

## Предварительные требования

- Terraform >= 1.0
- Docker и Docker Compose

## Развёртывание

```bash
# Клонируйте репозиторий и перейдите в директорию
cd terraform

# Инициализация Terraform
terraform init

# Просмотр плана развертывания
terraform plan

# Развертывание инфраструктуры
terraform apply
