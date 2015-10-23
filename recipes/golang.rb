# Use golang recipe to install bosun
default['go']['packages']           = ['bosun.org/cmd/bosun']
default['bosun']['install_path']    = "#{node['go']['gobin']}/bosun"

include_recipe 'golang::packages'
