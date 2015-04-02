include_recipe 'htpasswd'
include_recipe 'kibana_lwrp'

htpasswd "#{node['kibana']['install_dir']}/current/config/.htpasswd" do
  user node["relk"]["htpasswd"]["username"]
  password node["relk"]["htpasswd"]["password"]
end


