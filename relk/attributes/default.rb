# Authentication info
default['relk']['htpasswd']['username'] = 'admin'
default['relk']['htpasswd']['password'] = 'you_should_really_change_this'

# nginx configuration
default['relk']['nginx_kibana']['server_port'] = 80
default['relk']['nginx_kibana']['server_name'] = 'localhost'

# logstash input
default['relk']['logstash']['input']['sqs']['access_key'] = ''
default['relk']['logstash']['input']['sqs']['secret_key'] = ''
default['relk']['logstash']['input']['sqs']['region'] = ''
default['relk']['logstash']['input']['sqs']['queue'] = ''

# logstash output
default['relk']['logstash']['output']['elasticsearch']['host'] = ''
default['relk']['logstash']['output']['elasticsearch']['cluster'] = ''
default['relk']['logstash']['output']['elasticsearch']['index'] = 'logstash-%{+YYYY.MM.dd}'
default['relk']['logstash']['output']['elasticsearch']['index_type'] = 'logs'
default['relk']['logstash']['output']['elasticsearch']['use_dynamic_index_type'] = false
