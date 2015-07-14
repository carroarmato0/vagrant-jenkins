
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
  package { 'git': }

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
