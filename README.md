# RELK

A clean attempt to get an ELK stack running with RabbitMQ in AWS OpsWorks.

## VPC

### VPC Subnets

### VPC Security Groups

### VPC Load Balancers

## OpsWorks Stack

Settings for a new stack:

* __Default OS__: Ubuntu 14.04 LTS (latest at this time)
* __Hostname theme__: layer dependent
* __Chef version__: 11.10 (latest on OpsWorks at this time)
* __Use custom chef cookbooks__: yes
* __Repository URL__: the url for this repo: https://github.com/yogin/relk.git
* __Manage Berkshelf__: yes
* __Berkshelf version__: 3.1.5 (but doesn't really matter)
* __Use OpsWorks security groups__: no

### Stack Custom JSON
```json
{
    "java": {
        "install_flavor": "openjdk",
        "jdk_version": "7"
    },

    "elasticsearch": {
        "version": "<ES VERSION>",
        "plugins": {
            "elasticsearch/elasticsearch-cloud-aws": {
                "version": "<CLOUD AWS VERSION>"
            }
        },

        "path": {
            "data": [
                "/usr/local/var/data/elasticsearch/disk1"
            ]
        },

        "cluster": { 
            "name": "<CLUSTER NAME>" 
        },

        
        "cloud": {
            "aws": {
                "access_key": "<AWS ACCESS KEY>",
                "secret_key": "<AWS SECRET KEY>",
                "region": "<AWS REGION>"
            }
        },

        "discovery": {
            "type": "ec2",
            "ec2": {
                "tag": {
                    "opsworks:stack": "<OPSWORKS STACK NAME>",
                    "opsworks:layer:<OPSWORKS ELASTICSEARCH LAYER SHORTNAME>": "<OPSWORKS ELASTICSEARCH LAYER NAME>"
                }
            }
        },

        "data": {
            "devices": {
                "/dev/xvdc1": {
                    "file_system"      : "ext3",
                    "mount_options"    : "rw,user",
                    "mount_path"       : "/usr/local/var/data/elasticsearch/disk1",
                    "format_command"   : "mkfs.ext3",
                    "fs_check_command" : "dumpe2fs",
                    "ebs": {
                        "size"                  : 50,
                        "delete_on_termination" : false,
                        "type"                  : "gp2",
                        "iops"                  : 150
                    }
                }
            }
        }

    },

    "kibana": {
        "install_java": false,
        "webserver_hostname": "<EXTERNAL WEB HOSTNAME>",
        "es_server": "<INTERNAL ELASTICSEARCH LB HOSTNAME>"
    },

    "relk": {
        "htpasswd": {
            "username": "<AUTH USERNAME>",
            "password": "<AUTH PASSWORD>"
        },
        "kibana_nginx": {
            "server_port": 80,
            "server_name": "<EXTERNAL WEB HOSTNAME>"
        }
    }
}
```

* __CLUSTER NAME__: an unique name for your cluster (eg. `elasticsearch_production`)
* __ES VERSION__: `1.5.0` (latest at this time)
* __CLOUD AWS VERSION__: `2.5.0`. You need to find the correct version based on the version of ES you've chosen. See [cloud aws](https://github.com/elastic/elasticsearch-cloud-aws)
* __AWS ACCESS KEY__: AWS credentials
* __AWS SECRET KEY__: AWS credentials
* __AWS REGION__: AWS region your cluster is setup in
* __OPSWORKS STACK NAME__: name of your opsworks stack
* __OPSWORKS ELASTICSEARCH LAYER SHORTNAME__: shortname for your ES layer (see below)
* __OPSWORKS ELASTICSEARCH LAYER NAME__: name for your ES layer (see below)
* __EXTERNAL WEB HOSTNAME__: the (public) hostname you will use to access Kibana
* __INTERNAL ELASTICSEARCH LB HOSTNAME__: the hostname for Elasticsearch or a LoadBalancer to ES instances
* __AUTH USERNAME__: username for NGiNX auth
* __AUTH PASSWORD__: password for NGiNX auth


### Stack Layers

All layers should be setup as custom applications.

#### ElasticSearch Cluster

* __Name__: `ElasticSearch Cluster`
* __Shortname__: `elasticsearch`
* Recipes:
  * __Setup__: `java`, `elasticsearch`, `elasticsearch::aws`, `elasticsearch::ebs`, `elasticsearch::data`

#### Kibana Servers

* __Name__: `Kibana Servers`
* __Shortname__: `kibana`
* Recipes:
  * __Setup__: `java`, `kibana_lwrp::install`
  * __Configure__: `relk::nginx_kibana`

#### Logstash Cluster

#### RabbitMQ Cluster
