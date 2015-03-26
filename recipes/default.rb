#
# Cookbook Name:: bosun
# Recipe:: default
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

include_recipe 'golang::default'
include_recipe 'runit'

directory node['bosun']['conf_dir']

template "#{node['bosun']['conf_dir']}/bosun.conf" do
  cookbook node['bosun']['config_cookbook']
  source 'bosun.conf.erb'
end

runit_service 'bosun' do
  finish node['bosun']['runit']['finish']
end if node['bosun']['init_style'] == 'runit'
