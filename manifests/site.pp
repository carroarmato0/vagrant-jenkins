
node /master/ {

  include roles::jenkins_master



}

node /slave/ {

  include roles::jenkins_slave

}

node default {

  include common

}

class common {

  include jjb
  include timezone
  package { 'git':
    ensure  => latest,
    require => Yumrepo['rpmforge-extras'],
  }

  yumrepo { 'rpmforge-extras':
    baseurl    => 'http://apt.sw.be/redhat/el6/en/$basearch/extras',
    descr      => 'RHEL $releasever - RPMforge.net - extras',
    enabled    => '1',
    gpgcheck   => '0',
    mirrorlist => 'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge-extras',
  }

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
