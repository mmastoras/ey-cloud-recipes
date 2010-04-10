#
# Cookbook Name:: ci_crontab
# Recipe:: default
#

remote_file "/tmp/pac.crontab" do
  owner 'pac'
  group 'pac'
  mode 0755
  if ['ci_util'].include?(node[:instance_role])
    source "crontab.util"
  elsif ['solo'].include?(node[:instance_role])
    source "crontab.solo"
  elsif ['app', 'app_master'].include?(node[:instance_role])
    source "crontab.app"
  end
  backup false
  action :create
end

execute "setup-crontab" do
  command "cat '/tmp/pac.crontab' | sed 's/<environment>/#{node[:environment][:framework_env]}/' | crontab -u #{node[:owner_name]} -"
end



