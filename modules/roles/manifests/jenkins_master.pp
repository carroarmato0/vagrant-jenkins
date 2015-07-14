class roles::jenkins_master {

   include jenkins
   include jenkins::master
   include common

}
