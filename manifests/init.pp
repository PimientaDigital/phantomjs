# == Class: phantomjs
#
# Full description of class module here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class phantomjs (
  $package_develop = $::phantomjs::params::package_develop,
  $app_name = $::phantomjs::params::app_name,
  $version_repository = $::phantomjs::params::version_repository,
) inherits ::phantomjs::params {

  # validate parameters here

  class { '::phantomjs::install': } ->
    Class['::phantomjs']
}
