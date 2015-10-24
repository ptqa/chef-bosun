# Use golang recipe to install bosun
node.default['go']['packages']           = ['bosun.org/cmd/bosun']
node.default['bosun']['install_path']    = "#{node['go']['gobin']}/bosun"

include_recipe 'golang::packages'
