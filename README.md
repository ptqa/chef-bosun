bosun cookbook
===================
[![Build Status](https://travis-ci.org/ptqa/chef-bosun.svg?branch=master)](https://travis-ci.org/ptqa/chef-bosun)
[![Cookbook Version](https://img.shields.io/cookbook/v/bosun.svg)](https://supermarket.chef.io/cookbooks/bosun)
[![Code Climate](https://codeclimate.com/github/ptqa/chef-bosun.png)](https://codeclimate.com/github/ptqa/chef-bosun)
[![Gemnasium](https://img.shields.io/gemnasium/ptqa/chef-bosun.svg)](https://gemnasium.com/ptqa/chef-bosun)
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Chef cookbook for install & configure [bosun-server](ihttps://github.com/bosun-monitor/bosun). This cookbook only installs bosun binary with creates a service with your favorite init system. ***IT DOES NOT INSTALL OPENTSDB/HBASE.***

Requirements
------------

- Chef Client 11.x or better

### Platforms

* Centos
* Ubuntu
* Debian


### Dependent Cookbooks

- [poise-service-runit](https://github.com/poise/poise-service)
- [golang](https://github.com/NOX73/chef-golang)
- [chef-sugar](https://github.com/sethvargo/chef-sugar)

# Attributes
This cookbook is attribute driven. List of attributes that you can change:

* `node['bosun']['tsdb_host']`       - IP/hostname of your OpenTSDB instance (default '127.0.0.1')
* `node['bosun']['tsdb_port']`       - Port of your OpenTSDB instance (default '4242')
* `node['bosun']['install_style']`   - Way to install binary (default `binary`. Set to 'source' to build from sources. Set 'binary' to download realese from github.
* `node['bosun']['version']`         - Release to install. Check [bosun github](https://github.com/bosun-monitor/bosun/releases) for available releases (default '0.4').
* `node['bosun']['conf_dir']`        - Configuration directory (default '/etc/bosun/')
* `node['bosun']['log_dir']`         - Logs directory (default '/var/log/bosun/')
* `node['bosun']['open_files']`      - Max openfiles for bosun process (default '65535')
* `node['bosun']['config_cookbook']` - Source of template for bosun.conf (default 'bosun' aka this cookbook)
* `node['bosun']['init_style']`      - explicitly set the init system used (`systemd`, `runit`, `sysvinit`, `upstart` or `inittab`). Default is `runit`.

# Usage

```ruby
# optional: define your own template in your_company_cookbook/templates/default/bosun.conf.erb
node.override['bosun']['config_cookbook'] = 'your_company_cookbook'

include_recipe [bosun::default]
```

Testing
-----

[Kitchen](http://kitchen.ci) tests via [busser-serverspec](https://github.com/test-kitchen/busser-serverspec):
* `kitchen test`

License & Authors
-----------------
- Author:: [@ptqa](https://github.com/ptqa)
- Author:: [@timurb](https://github.com/timurb)

```text

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
