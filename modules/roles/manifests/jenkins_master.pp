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


}
