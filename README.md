# chef-bosun
Chef cookbook for bosun-server

This cookbook is kinda usable, but it only installs bosun binary with runit service. ***IT DOES NOT INSTALL OPENTSDB/HBASE.***

# Attributes
This cookbook is attribute driven. List of attributes that you can change:

* `node['bosun']['tsdb_host']` - IP/hostname of your OpenTSDB instance (default '127.0.0.1')
* `node['bosun']['tsdb_port']` - Port of your OpenTSDB instance (default '4242')
* `node['bosun']['conf_dir']`  - Configuration directory (default '/etc/bosun/')
* `node['bosun']['log_dir']`   - Logs directory (default '/var/log/bosun/')
* `node['bosun']['open_files']` - Max openfiles for bosun process (default '65535')
* `node['bosun']['config_cookbook']` - Source of template for bosun.conf (default 'bosun' aka this cookbook)

# Usage
Add recipe[bosun] to your node runlist.

# Supported platforms

Tested on Ubuntu, should work on Debian, may work on others.

# Authors

[@ptqa](https://github.com/ptqa)
