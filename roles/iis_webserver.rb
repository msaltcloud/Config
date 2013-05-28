name 'iis_webserver'
description 'A single IIS web server'
run_list(
  'recipe[webpi]'
)