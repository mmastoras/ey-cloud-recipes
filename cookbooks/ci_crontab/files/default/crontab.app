# hourly sphinx reindex
20 * * * * cd /data/coney_island/current;rake RAILS_ENV=<environment> thinking_sphinx:reindex >> /data/coney_island/current/log/hourly_sphinx_reindex.log 2>&1
