case $::hostname {

  'appserver':{
    package{ 'nodejs':
       ensure => 'present',
       require => Exec['nn']
      }
    package{ 'curl':
       ensure => 'installed',
       require => Exec['aptget']
      }
    exec { 'aptget':
       command => '/usr/bin/apt-get update -y'
      }
    exec { 'nn':
      command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
      require => Exec['aptget']
  }
 }

  'dbsever':{
    package { 'mysql-server':
    ensure => latest,
    }
  }
}
