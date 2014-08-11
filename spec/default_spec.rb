require_relative 'spec_helper'

describe "apt-periodic::default" do
  let(:chef_run) { ChefSpec::Runner.new }

  context "with default attributes" do
    before do
      chef_run.node.set['apt_periodic']['unattended_upgrade_interval'] = 1
      chef_run.converge(described_recipe)
    end

    let(:periodic) { File.read("test/integration/default/serverspec/fixtures/10periodic") }

    it { expect(chef_run).to include_recipe("apt") }
    it { expect(chef_run).to install_package("unattended-upgrades") }
    it { expect(chef_run).to create_template("/etc/apt/apt.conf.d/10periodic") }
    it { expect(chef_run).to create_template("/etc/apt/apt.conf.d/50unattended-upgrades") }
    it { expect(chef_run).to render_file("/etc/apt/apt.conf.d/10periodic").with_content(periodic) }
  end

  context "with mail attribute" do
    before do
      chef_run.node.set['apt_periodic']['unattended_upgrade_interval'] = 1
      chef_run.node.set['apt_periodic']['unattended_upgrades']['mail'] = "admin@crazy-automation.io"
      chef_run.converge(described_recipe)
    end

    let(:unattended_upgrades) { File.read("test/integration/default/serverspec/fixtures/50unattended-upgrades") }

    it { expect(chef_run).to install_package("mailutils") }
    it { expect(chef_run).to render_file("/etc/apt/apt.conf.d/50unattended-upgrades").with_content(unattended_upgrades) }
  end
end
