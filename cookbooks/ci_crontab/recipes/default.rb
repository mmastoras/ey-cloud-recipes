#
# Cookbook Name:: ci_crontab
# Recipe:: default
#
execute "setup-ci-crontab" do
  command "(echo '15 * * * * cd /data/coney_island/current;rake RAILS_ENV=production scheduled_tasks:hourly >> /data/coney_island/current/log/hourly.log 2>&1';) | uniq | crontab -u #{node[:owner_name]} -"
  command "(echo ''30 11 * * 6 cd /data/coney_island/current;rake RAILS_ENV=production scheduled_tasks:weekly >> /data/coney_island/current/log/weekly.log 2>&1';) | uniq | crontab -u #{node[:owner_name]} -"
  command "(echo '0 12 * * * cd /data/coney_island/current;rake RAILS_ENV=production scheduled_tasks:daily >> /data/coney_island/current/log/daily.log 2>&1') | uniq | crontab -u #{node[:owner_name]} -"
end
