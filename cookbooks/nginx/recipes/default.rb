#
# Cookbook Name:: nginx
# Recipe:: default
#
puts "nginx recipe running on environment => #{node[:environment][:framework_env]}"
if node[:environment][:framework_env] == 'staging'
  remote_file "/etc/nginx/servers/coney_island.users" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.users"
    backup false
    action :create
  end
end

if node[:environment][:framework_env] == 'staging'
  remote_file "/etc/nginx/servers/coney_island.conf" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.staging.conf"
    backup false
    action :create
  end
  
  remote_file "/etc/nginx/servers/coney_island.ssl.conf" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.ssl.staging.conf"
    backup false
    action :create
  end
elsif node[:environment][:framework_env] == 'production'
  puts "uploading new coney_island.conf file"
  remote_file "/etc/nginx/servers/coney_island.conf" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.production.conf"
    backup false
    action :create
  end
  
  remote_file "/etc/nginx/servers/coney_island.ssl.conf" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.ssl.production.conf"
    backup false
    action :create
  end
elsif node[:environment][:framework_env] == 'demo'
  remote_file "/etc/nginx/servers/coney_island.conf" do
    owner 'pac'
    group 'pac'
    mode 0755
    source "coney_island.demo.conf"
    backup false
    action :create
  end
end

execute "restart-nginx" do
  command "/etc/init.d/nginx restart"
end
