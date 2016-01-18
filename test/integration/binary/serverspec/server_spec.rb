# Encoding: utf-8
require 'serverspec'

set :backend, :exec

describe package('runit') do
  it { should be_installed }
end

describe file('/usr/local/bin/bosun') do
  it { should be_file }
end

describe file('/etc/service/bosun') do
  it { should be_symlink }
end

# as default attributes
describe file('/etc/sv/bosun/run') do
  it { should be_file }
  it { should contain 'ulimit' }
end

describe file('/etc/bosun/bosun.conf') do
  it { should be_file }
  it { should contain 'tsdbHost=' }
end

describe process('bosun') do
  it { should be_running }
end
