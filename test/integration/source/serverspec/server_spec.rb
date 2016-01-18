# Encoding: utf-8
require 'serverspec'

set :backend, :exec

describe file('/opt/go/bin/bosun') do
  it { should be_file }
end

describe process('bosun') do
  it { should be_running }
end
