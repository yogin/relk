#!/usr/bin/env ruby
# -*- encoding : utf-8 -*-
source 'https://api.berkshelf.com'

cookbook 'java', '~> 1.31.0'
cookbook 'elasticsearch', '~> 0.3.13'
cookbook 'htpasswd', '~> 0.2.4'
cookbook 'ohai', '~> 2.0.1'
cookbook 'simple-logstash', '~> 0.2.1'

cookbook 'kibana_lwrp', '~> 2.0.4', git: 'https://github.com/lusis/chef-kibana.git'

# OpsWork is still running with Chef 11
# Chef 12 introduced breaking changes by adding a "compile_time" directive
# which conflicts with chef-sugar
# Latest versions of sugar are compatible with Chef 12
# In the meantime we'll use an older version
# See http://jtimberman.housepub.org/blog/2015/03/20/chef-gem-compile-time-compatibility/
# See https://github.com/sethvargo/chef-sugar/issues/97
cookbook 'chef-sugar', '~> 3.0.1'
# Same story for libarchive
cookbook 'libarchive', '~> 0.4.4'

