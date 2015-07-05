# == Class phantomjs::install
#
# This class is called from module for install.
#
class phantomjs::install {

  package {
    $::phantomjs::package_develop:
    ensure => present,
  }

  exec { "phantomjs clone repository":
    command => "git clone git://github.com/ariya/phantomjs.git",
    cwd     => "/var/tmp/",
    require => Package["git"],
    unless  => "ls -l /var/tmp/$::phantomjs::app_name",
  }

  exec { "phantomjs version repository":
    command => "git checkout $::phantomjs::version_repository",
    cwd     => "/var/tmp/$::phantomjs::app_name",
    unless  => "git branch | grep $::phantomjs::version_repository",
    require => [Exec["phantomjs clone repository"]],
  }

  exec { "phantomjs build":
    command => "/var/tmp/$::phantomjs::app_name/build.sh --confirm",
    returns => [0, 2, 14],
    cwd     => "/var/tmp/$::phantomjs::app_name",
    require => [Exec["phantomjs version repository"]],
    unless  => "which $::phantomjs::app_name",
    logoutput  => true,
  }

}
