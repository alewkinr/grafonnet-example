local dashboard = import './dashboards/general/general.jsonnet';

// dashboard variables
local dashboard_folder = 'IaaC-dashboards';
local dashboard_name = 'Example Dashboard';

{
  grafanaDashboardFolder:: dashboard_folder,
  grafanaDashboards+:: {
    'dashboard.json':  dashboard,
  }
}