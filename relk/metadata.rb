name 'relk'
description 'RELK Cookbook'
maintainer 'Anthony YoGiN Powles'
version '1.0.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
license "MIT"

depends 'htpasswd'
depends 'nginx'
depends 'kibana_lwrp'

supports 'ubuntu'
supports 'debian'

