include_recipe "simple-logstash"

#template "#{node['logstash']['prefix_root']}/pat/to/logstash.conf" do
  #source "logstash.conf.erb"
  #owner node['logstash']['user']
  #group node['logstash']['group']
  #mode '0600'
  #variables({
    #sqs_queue: node['relk']['logstash']['input']['sqs']['queue'],
    #aws_access_key: node['relk']['logstash']['input']['sqs']['access_key'],
    #aws_secret_key: node['relk']['logstash']['input']['sqs']['secret_key'],
    #aws_region: node['relk']['logstash']['input']['sqs']['region'], 
    #elasticsearch_host: node['relk']['logstash']['output']['elasticsearch']['host'],
    #elasticsearch_cluster: node['relk']['logstash']['output']['elasticsearch']['cluster']
  #})
#end

logstash_config 'sqs_to_es' do
  source "logstash.conf.erb"
  variables({
    sqs_queue: node['relk']['logstash']['input']['sqs']['queue'],
    aws_access_key: node['relk']['logstash']['input']['sqs']['access_key'],
    aws_secret_key: node['relk']['logstash']['input']['sqs']['secret_key'],
    aws_region: node['relk']['logstash']['input']['sqs']['region'], 
    elasticsearch_host: node['relk']['logstash']['output']['elasticsearch']['host'],
    elasticsearch_cluster: node['relk']['logstash']['output']['elasticsearch']['cluster']
  })
end
