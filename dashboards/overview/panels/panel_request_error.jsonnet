local grafana = import '../../vendor/grafonnet/grafana.libsonnet';
local panel = grafana.graphPanel;
local statPanel = grafana.statPanel;
local prometheus = grafana.prometheus;
local template = grafana.template;

{
Panel:: panel.new(
    title='RE ($serviceName)',
    description='Кол-во ошибок в $serviceName',
    transparent=true,
    format='none',
    datasource='Prometheus',
    span=2,
    aliasColors={
      '5xx': 'dark-red'
    },
  )
  .addTarget(
    prometheus.target(
      'sum(rate(http_server_request_count_bucket{http_status=~\"5..\"}[1m]))',
      legendFormat='5xx',
    ),
  ) 
}