execute "testing" do
  command %Q{
    echo "i ran at #{Time.now}" >> /root/cheftime
  }
end

# uncomment if you want to run couchdb recipe
# require_recipe "couchdb"

# uncomment to turn use the MBARI ruby patches for decreased memory usage and better thread/continuationi performance
#require_recipe "mbari-ruby"

# node[:name] only exists for multi-instance enviroments (ie. production environments)
# no thinking sphinx on utility instances
unless node[:name] == 'main_site_util' || node[:name] == 'ci_util' 
  require_recipe "thinking_sphinx"
end

# uncomment to turn on ultrasphinx 
# require_recipe "ultrasphinx"

#uncomment to turn on memcached
unless node[:name] == 'main_site_util' || node[:name] == 'ci_util'
  require_recipe "memcached"
end

#uncomment to run the authorized_keys recipe
#require_recipe "authorized_keys"

#uncomment to run the delayed_job recipe
# delayed job runs only on utility instances or staging evironments
if node[:name] == 'main_site_util' || node[:name] == 'ci_util' || node[:environment][:framework_env] == 'staging'
  require_recipe "delayed_job"
end

# setup crons on CI only
if node[:environment][:name].include?('ci_')
  require_recipe "ci_crontab"
end

# custom nginx conf for ci_staging only
if node[:environment][:name] == 'ci_staging' 
  require_recipe "nginx"
end

#uncomment to run the wkhtmltopdf recipe
#require_recipe "wkhtmltopdf"
