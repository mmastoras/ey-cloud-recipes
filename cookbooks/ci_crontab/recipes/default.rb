#
# Cookbook Name:: ci_crontab
# Recipe:: default
#
remote_file "/tmp/pac.crontab" do
  owner 'pac'
  group 'pac'
  mode 0755
  source "crontab"
  backup false
  action :create
end

execute "setup-ci-crontab" do
  command "(cat '/tmp/pac.crontab'; | uniq | crontab -u #{node[:owner_name]} -"
end
