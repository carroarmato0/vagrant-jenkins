
node /master/ {

  include common
  include jenkins

}

node /slave/ {

  include common
  include jenkins::slave

}

node default {

  include common

}

class common {

	$default_pkg = [
		'git',
	]

	package { $default_pkg:
		ensure => installed,
	}

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
