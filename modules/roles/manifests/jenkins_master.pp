class roles::jenkins_master {

  include jenkins
  include jenkins::master
  include common

  exec { 'Create DSL Pipeline':
    command => 'sleep 30; jenkins-jobs update /vagrant/jenkins-dsl-playground/jenkins-dsl-pipeline.yaml',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    unless  => 'test -d /var/lib/jenkins/jobs/jenkins-dsl-checkout/',
    require => [ Class['jjb'], Service['jenkins'], ],
  }

  exec { 'Initial DSL Pipeline Trigger':
    command => 'curl --silent --show-error http://localhost:8080/job/jenkins-dsl-checkout/build && touch /home/vagrant/.initialbuildsuccess',
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    onlyif  => 'test -d /var/lib/jenkins/jobs/jenkins-dsl-checkout/',
    creates => '/home/vagrant/.initialbuildsuccess',
    require => [ Class['jjb'], Service['jenkins'], ],
  }

}
