#
# Cookbook Name:: crontab_mailto
# Recipe:: default
#
execute "cron-MAILTO" do
  command "(echo 'MAILTO=railsteam@proaptitude.com'; crontab -u #{node[:owner_name]} -l) | uniq | crontab -u #{node[:owner_name]} -"
end

