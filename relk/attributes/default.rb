# Authentication info
default['relk']['htpasswd']['username'] = 'admin'
default['relk']['htpasswd']['password'] = 'you_should_really_change_this'

# nginx configuration
default['relk']['nginx_kibana']['server_port'] = 80
default['relk']['nginx_kibana']['server_name'] = 'localhost'
