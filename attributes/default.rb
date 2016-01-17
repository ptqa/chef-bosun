# This cookbook support only runit
default['bosun']['init_style']      = 'runit'
default['bosun']['install_style']   = 'binary' # binary or source

default['bosun']['tsdb_host']       = '127.0.0.1'
default['bosun']['tsdb_port']       = '4242'

default['bosun']['conf_dir']        = '/etc/bosun'
default['bosun']['log_dir']         = '/var/log/bosun'
default['bosun']['open_files']      = 65_535
default['bosun']['install_path']    = '/usr/local/bin/bosun'

default['bosun']['config_cookbook'] = 'bosun'

# Installation source

default['bosun']['release_url'] = 'https://github.com/bosun-monitor/bosun/releases/download'
default['bosun']['version'] = '0.4.0'

