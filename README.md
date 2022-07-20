# Dashboards-as-a-Code

Пример описывает использование тулинга вокруг Grafana для генерации шаблонов из кода и деплой через CI/CD процессы

## Зависимости

- Для управления зависимостями используется [jsonnet-builder](https://github.com/jsonnet-bundler/jsonnet-bundler)
- Для разработки дашбордов используется [grafonnet-lib](https://grafana.github.io/grafonnet-lib/)
- Для деплоя используется [grizzly](https://grafana.github.io/grizzly)
- Для скриптов сборки и деплоя [Taskfile](https://taskfile.dev)

## Установка зависимостей

Для установки всех зависимостей на MacOS с Apple Silicon можно использовать команду `task build`.
Для других операционных систем нужно писать команду вручную.

## Переменные окружения

| Name | Description | Required | Default |
|------|-------------|----------|---------|
|GRAFANA_URL|Fully qualified domain name of your Grafana instance.|    true    |-|
|GRAFANA_USER|Basic auth username if applicable.|false|api_key|
|GRAFANA_TOKEN|Basic auth password or API token.|false|-|

## Разработка

Для разработки удобно использовать нижеописанную команду

```bash
➜ grr watch . template.jsonnet
```

❗️ В этом режиме grizzly следит за обновлением локальных файлов и автоматически изменяет дашборд в удаленной Grafana

## Деплой

Для деплоя изменений в вашу Grafana можно использовать команду `task deploy`
