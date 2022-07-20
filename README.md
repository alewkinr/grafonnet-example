# Генерация dashboard в grafana

Для работы с dashboard grafana используется [grafonnet-lib](https://grafana.github.io/grafonnet-lib/)   
Для генерации шаблонов на основе библиотеки grafonnet используется [jsonnet](https://jsonnet.org)    
Для деплоя на remote grafana используется приложение [grizzle](https://grafana.github.io/grizzly)   
Для работы с зависимостями используется [jsonnet-builder](https://github.com/jsonnet-bundler/jsonnet-bundler)

## Установка пакетного мендеджера [jsonnet-builder](https://github.com/jsonnet-bundler/jsonnet-bundler) для jsonnet

```bash
➜ brew install jsonnet-bundler
```

или

```
➜ go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
```

## Собрать зависимости

```bash
➜ jb install
```

Результатом выполенния команды получаем дирректорию vendor с необходимымыи зависимостями для сборки и деплоя

## Для деплоя и отладки используется [grezzle](https://grafana.github.io/grizzly/installation/) .

Предварительно необходимо установить переменные сред

| Name | Description | Required | Default |
|------|-------------|----------|---------|
|GRAFANA_URL|Fully qualified domain name of your Grafana instance.|    true    |-|
|GRAFANA_USER|Basic auth username if applicable.|false|api_key|
|GRAFANA_TOKEN|Basic auth password or API token.|false|-|

Токен можно получить в UI grafana под уз admin

После установки переменных сред grezzle можно запусть
> Внимание! в этом режиме каждое успешное изменение меняет remote dashboard

```bash
➜ grr watch . template.jsonnet
```

Полный список команд greezle в [документации](https://grafana.github.io/grizzly/workflows/) .

## Для ручной генерации dashboard используется [jsonnet](https://github.com/google/jsonnet#packages) .

``` bash
➜ jsonnet -J vendor/grafonnet ./dashboards/general/general.jsonnet -o dashboard.json
```

## Пример как деплоить

```bash
cd dashboard/grafana
jb install
grr apply template.jsonnet
```

## Пример как войти в режим разработки и отслеживания изменений

```bash
cd dashboard/grafana
jb install
grr watch . template.jsonnet
```