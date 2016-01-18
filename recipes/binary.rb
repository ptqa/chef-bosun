#
# Cookbook Name:: bosun
# Recipe:: binary
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'chef-sugar'

node.default['bosun']['arch'] = _64_bit? ? 'amd64' : '386'
node.default['bosun']['binary'] = "bosun-#{node['os']}-#{node['bosun']['arch']}"

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
