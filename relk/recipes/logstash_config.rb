include_recipe "simple-logstash"

logstash_input 'sqs' do
  service 'logstash'
  variables({
    sqs_queue: node['relk']['logstash']['input']['sqs']['queue'],
    aws_access_key: node['relk']['logstash']['input']['sqs']['access_key'],
    aws_secret_key: node['relk']['logstash']['input']['sqs']['secret_key'],
    aws_region: node['relk']['logstash']['input']['sqs']['region'], 
  })
end

logstash_output 'es' do
  service 'logstash'
  variables({
    elasticsearch_host: node['relk']['logstash']['output']['elasticsearch']['host'],
    elasticsearch_cluster: node['relk']['logstash']['output']['elasticsearch']['cluster']
  })
end

logstash_service 'logstash'

