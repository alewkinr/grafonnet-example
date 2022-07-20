local grafana = import '../../vendor/grafonnet/grafana.libsonnet';
local graphPanel = grafana.graphPanel;
local statPanel = grafana.statPanel;
local prometheus = grafana.prometheus;
local template = grafana.template;

{
    Panel:: statPanel.new(
            title='Healthz ($serviceName)',
            description='Статус хелзчеков $serviceName',
            transparent=true,
            datasource='Prometheus',
            orientation='horizontal',
            justifyMode='auto',
            colorMode='value',
            graphMode='area',
        )
        .addMappings([
        {
        'options': {
            '0': {
            'color': 'red',
            'index': 1,
            'text': 'down',
            },
            '1': {
            'color': 'green',
            'index': 0,
            'text': 'up',
            },
            '': {
            'color': 'orange',
            'index': 2,
            'text': 'warn',
            },
        },
        'type': 'value',
        },
    ])
    .addTarget(
        prometheus.target(
        'up{job=\"$serviceName-primary\"}',
        legendFormat='{{datacenter}} - {{instance}}'
        )
    ),
}