#
# Cookbook Name:: bosun
# Recipe:: configure
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

directory node['bosun']['conf_dir']
directory node['bosun']['log_dir']

template "#{node['bosun']['conf_dir']}/bosun.conf" do
  cookbook node['bosun']['config_cookbook']
  source 'bosun.conf.erb'
  notifies :restart, 'poise_service[bosun]'
end

poise_service 'bosun' do
  provider node['bosun']['init_style'].to_sym
  # hacky way to set ulimit without modifying service template
  command "bash -c 'ulimit -n #{node['bosun']['open_files']}; \
    exec #{node['bosun']['install_path']} -c=#{node['bosun']['conf_dir']}/bosun.conf'"
end
