include_recipe 'htpasswd'
include_recipe 'kibana_lwrp'

htpasswd_file = "#{node['kibana']['install_dir']}/current/config/.htpasswd" 
htpasswd htpasswd_file do
  user node["relk"]["htpasswd"]["username"]
  password node["relk"]["htpasswd"]["password"]
end

include_recipe 'nginx'

template "#{node[:nginx][:dir]}/sites-available/default" do
  source 'nginx_kibana.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    kibana_port: node['kibana']['java_webserver_port'],
    server_port: node['relk']['nginx_kibana']['server_port'],
    server_name: node['relk']['nginx_kibana']['server_name'],
    htpasswd_file: htpasswd_file,
  })
  notifies :restart, 'service[nginx]'
end

