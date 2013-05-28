name 'iis_webserver'
description 'A single IIS web server'
run_list(
  'recipe[webpi]',
  'recipe[webpi::iis_recommended]',
  'recipe[webpi::install-sql-express]',
  'recipe[webpi::install-mvc4]'
)