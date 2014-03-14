require 'spec_helper'

describe file('/etc/apt/apt.conf.d/10periodic') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
  its(:content) { should eq File.read(File.join(ENV['BUSSER_ROOT'], 'suites/serverspec/fixtures/10periodic')) }
end

describe file('/etc/apt/apt.conf.d/50unattended-upgrades') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
  its(:content) { should eq File.read(File.join(ENV['BUSSER_ROOT'], 'suites/serverspec/fixtures/50unattended-upgrades')) }
end

describe package('unattended-upgrades') do
  it { should be_installed }
end

describe package('mailutils') do
  it { should be_installed }
end
