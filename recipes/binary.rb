# Download

remote_file 'bosun_release_binary' do
  path node['bosun']['install_path']
  source [
    node.bosun['release_url'],
    node.bosun['version'],
    node.bosun['binary']
  ].join('/')
  owner 'root'
  mode '0755'
  action :create
end
