include_recipe 'htpasswd'
include_recipe 'kibana_lwrp'

kibana_config = "#{node['kibana']['install_dir']}/current/#{node['kibana'][install_type]['config']}"
htpasswd "#{kibana_config}/.htpasswd" do
  user node["relk"]["htpasswd"]["username"]
  password node["relk"]["htpasswd"]["password"]
end


