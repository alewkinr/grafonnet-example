local grafana = import '../../vendor/grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;

local overview = import '../overview/dashboard.jsonnet';

dashboard.new(
  'Overview',
  schemaVersion=16,
  tags=['services']
)
.addPanel(
  /**
  * SERVICE PANELS
  */
  overview.HelthCehck.Panel,
   gridPos={
    'h': 8,
    'w': 6,
    'x': 0,
    'y': 0
  },
)
.addPanel(
  overview.CountError.Panel,
  gridPos={
    'h': 8,
    'w': 6,
    'x': 6,
    'y': 0
  }
)
.addPanel(
  overview.RequestLetancy.Panle,
   gridPos={
    'h': 8,
    'w': 6,
    'x': 12,
    'y': 0
  }
)
.addPanel(
overview.RequestCount.Panel,
 gridPos={
    'h': 8,
    'w': 6,
    'x': 18,
    'y': 0
  }
)
  /**
  * OTHER PANELS
  * .addPanel
  * ...
  */