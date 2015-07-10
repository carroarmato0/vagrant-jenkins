
node /master/ {

  include jenkins
  include jenkins::master
  include common

  exec { 'Pull initial Repo':
    command   => 'git clone https://github.com/KrisBuytaert/jenkins-dsl-playground.git',
    path      => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    logoutput => true,
    notify    => Exec['Create DSL Pipeline'],
    unless    => ["test -d ./jenkins-dsl-playground"]
  }

  exec { 'Create DSL Pipeline':
    command     => 'sleep 30; jenkins-jobs update ./jenkins-dsl-playground/jenkins-dsl-pipeline.yaml',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

  Package['git'] -> Class['jenkins::master'] -> Class['jjb'] -> Service['jenkins'] -> Exec['Pull initial Repo']

}

node /slave/ {

  include jenkins::slave
  include common

}

node default {

  include common

}

class common {

  include jjb
  package { 'git': }

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
