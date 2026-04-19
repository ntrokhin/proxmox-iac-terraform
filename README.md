# proxmox-iac-terraform

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Status](https://img.shields.io/badge/status-active-brightgreen)

Автоматизация развёртывания виртуальных машин Debian 12 в Proxmox с использованием Terraform и Gitea Actions.

## Что делает

- Создаёт указанное количество ВМ с уникальными IP (привязка к VMID)
- Настраивает SSH-доступ через публичный ключ из Gitea Secrets
- Полностью автоматизировано: `git push` → ВМ готовы к работе

## Структура

- `terraform/` – конфигурация Terraform
- `docs/` – описание проекта и решённых проблем

## Связанные проекты

- [Home Infrastructure Lab (Proxmox VE)](https://github.com/ntrokhin/Home-Infrastructure-Lab-Proxmox-VE) – комплексная лаборатория корпоративной сети
