# This cookbook support only runit
default['bosun']['init_style']           = 'runit'

default['bosun']['tsdb_host']           = '127.0.0.1'
default['bosun']['tsdb_port']           = '4242'

default['bosun']['conf_path']           = '/etc/bosun/bosun.conf'
default['bosun']['log_dir']             = '/var/log/bosun/'

default['bosun']['config_cookbook']     = 'bosun'

# Use golang recipe to install bosun
default['golang']['packages']           = ['bosun.org/cmd/bosun']
