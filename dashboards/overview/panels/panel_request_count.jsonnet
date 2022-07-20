local grafana = import '../../vendor/grafonnet/grafana.libsonnet';
local graphPanel = grafana.graphPanel;
local statPanel = grafana.statPanel;
local prometheus = grafana.prometheus;
local template = grafana.template;

{
 Panel::   graphPanel.new(
    title='PRS ($serviceName)',
    description='Кол-во запросов в секунду в $serviceName',
    transparent=true,
    format='none',
    datasource='Prometheus',
    span=2,
    aliasColors={
      '5xx': 'dark-red'
    },
  )
  .addTargets([
    prometheus.target(
      'sum(rate(http_server_request_count_bucket{http_status=~\"2..\"}[1m]))',
      legendFormat='2xx',
    ),
    prometheus.target(
      'sum(rate(http_server_request_count_bucket{http_status=~\"3..\"}[1m]))',
      legendFormat='3xx',
    ),
    prometheus.target(
      'sum(rate(http_server_request_count_bucket{http_status=~\"4..\"}[1m]))',
      legendFormat='4xx',
    ),
    prometheus.target(
      'sum(rate(http_server_request_count_bucket{http_status=~\"5..\"}[1m]))',
      legendFormat='5xx',
    ),
  ])
}