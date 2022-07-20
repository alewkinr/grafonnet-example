local grafana = import '../../vendor/grafonnet/grafana.libsonnet';
local graphPanel = grafana.graphPanel;
local statPanel = grafana.statPanel;
local prometheus = grafana.prometheus;
local template = grafana.template;

{
  Panle:: graphPanel.new(
    title='RD ($serviceName)',
    description='Задержка выполнения запросов в $serviceName в миллисекундах',
    transparent=true,
    format='ms',
    datasource='Prometheus',
    span=2,
  )
  .addTargets([
    prometheus.target(
      'quantile(0.95, http_server_latency) by (container)',
      legendFormat='p95',
    ),
    prometheus.target(
      'quantile(0.9, http_server_latency) by (container)',
      legendFormat='p90',
    ),
    prometheus.target(
      'quantile(0.5, http_server_latency) by (container)',
      legendFormat='p50',
    ),
  ])
}