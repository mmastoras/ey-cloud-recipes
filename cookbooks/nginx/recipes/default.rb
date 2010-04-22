#
# Cookbook Name:: nginx
# Recipe:: default
#
remote_file "/etc/nginx/servers/coney_island.users" do
  owner 'pac'
  group 'pac'
  mode 0755
  source "coney_island.users"
  backup false
  action :create
end

remote_file "/etc/nginx/servers/coney_island.conf" do
  owner 'pac'
  group 'pac'
  mode 0755
  source "coney_island.conf"
  backup false
  action :create
end