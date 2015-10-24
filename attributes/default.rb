# This cookbook support only runit
default['bosun']['init_style']      = 'runit'
default['bosun']['install_style']   = 'binary' # binary or golang

default['bosun']['tsdb_host']       = '127.0.0.1'
default['bosun']['tsdb_port']       = '4242'

default['bosun']['conf_dir']        = '/etc/bosun/'
default['bosun']['log_dir']         = '/var/log/bosun/'
default['bosun']['open_files']      = 65535
default['bosun']['install_path']    = '/usr/local/bin/bosun'

default['bosun']['config_cookbook'] = 'bosun'


# Installation source

default['bosun']['release_url'] = 'https://github.com/bosun-monitor/bosun/releases/download'
default['bosun']['version'] = '0.4.0'

case node['kernel']['machine']
when 'x86_64'
  default['bosun']['arch'] = 'amd64'
else
  default['bosun']['arch'] = '386'
end

default['bosun']['binary'] = "bosun-#{node['os']}-#{node['bosun']['arch']}"
