# hourly sphinx reindex
20 * * * * cd /data/coney_island/current;rake RAILS_ENV=<environment> thinking_sphinx:reindex >> /data/coney_island/current/log/hourly_sphinx_reindex.log 2>&1
# clear memcache daily
0 13 * * * cd /data/coney_island/current;rake RAILS_ENV=<environment> memcache:clear >> /data/coney_island/current/log/memcache_clear.log 2>&1
# build sitemap daily
30 9 * * * cd /data/coney_island/current;rake RAILS_ENV=<environment> admin:build_sitemap >> /data/coney_island/current/log/build_sitemap.log 2>&1
# sweep home page every 30 minutes
0,30 * * * cd /data/coney_island/current;rake RAILS_ENV=<environment> sweeper:every_30 >> /data/coney_island/current/log/sweeper.log 2>&1
