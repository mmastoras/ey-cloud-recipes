#
# Cookbook Name:: dallas_crontab
# Recipe:: default
#

ey_cloud_report "dallas_crontab" do
  message "installing dallas crontab"
end

unless node[:instance_role].include?('db')
  remote_file "/tmp/deploy.crontab" do
    owner 'deploy'
    group 'deploy'
    mode 0755
    if ['util'].include?(node[:instance_role])
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
    command "cat '/tmp/deploy.crontab' | sed 's/<environment>/#{node[:environment][:framework_env]}/' | crontab -u #{node[:owner_name]} -"
  end
end



