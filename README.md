# vagrant-jenkins
Puppet POC with the upstream jenkins module

## What you get

- 3 VM's using Centos 6.6 with the Virtualbox guest utils installed and Puppet.
- Jenkins Master which doesn't have executors
- A couple of slaves automatically connecting to the Master with 2 executors each
- Some default plugins added by default (check hieradata/common.yaml for the listing)

1) git pull --rebase; git submodule sync; git submodule update --init --recursive;

2) vagrant up;

3) Open your browser and point to http://192.168.33.21:8080/
