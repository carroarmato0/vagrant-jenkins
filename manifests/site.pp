
node /master/ {

  include common

}

node /slave/ {

  include common

}

node default {

  include common

}

class common {

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
