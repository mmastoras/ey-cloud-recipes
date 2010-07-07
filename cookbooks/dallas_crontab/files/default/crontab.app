# hourly sphinx reindex
# clear memcache daily
0 13 * * * cd /data/main_site/current;rake RAILS_ENV=<environment> memcache:clear >> /data/coney_island/current/log/memcache_clear.log 2>&1
