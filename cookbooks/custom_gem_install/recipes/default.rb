#
# Cookbook Name:: custom_gem_install
# Recipe:: default
#

execute "install-libxml-ruby" do
  command "gem install libxml-ruby --version=1.1.3"
end
