name             'apt-periodic'
maintainer       'Vincent Durand'
maintainer_email 'vincent.durand@madwork.org'
license          'MIT'
description      'Installs/configures apt-periodic and unattended-upgrades'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
supports         'ubuntu', '>= 12.04'
depends          'apt'
