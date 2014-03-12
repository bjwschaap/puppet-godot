# == Class: godot
#
# This module will install Nodejitsu's Godot event processor.
# Godot is a streaming real-time event processor based on Riemann written in Node.js.
# For more information on Godot see: http://blog.nodejitsu.com/waiting-for-godot
#
# Note that this module does *not* install Nodejs and NPM. These should be
# included already through another module (e.g. puppetlabs-nodejs).
#
# This class has only been tested on Centos 6.5 so far!
#
# === Parameters
#
# [*ensure*]
#   Optional. Allowed values are present, stopped, running.
#   Default running. Value 'present' is supported because
#   it's the default value for ensure in almost every
#   class and defined type. Ensure present does the
#   same as running. Default value 'running' was chosen
#   because it's more concise.
#
# [*archive*]
#   URL pointing to the Godot release tarball. Defaults to:
#   https://github.com/nodejitsu/godot/archive/v0.5.3.tar.gz
#
# [*install_dir*]
#   Directory where Godot needs to be installed. Defaults to
#   /opt/godot
#
# [*proxy_url*]
#   Optional. URL with http(s) proxy for downloading the Godot
#   archive file.
#
# [*server_js*]
#   Optional. Contents of your own custom godot node.js script.
#
# === Examples
# This example installs godot 0.5.3 to /opt/godot:
#
#  class { godot:
#    ensure => present
#  }
#
class godot(
  $ensure      = 'running',
  $archive     = $godot::params::archive,
  $install_dir = $godot::params::install_dir,
  $proxy_url   = undef,
  $server_js   = undef

) inherits godot::params {

  # Defaults
  File {
    owner => $godot::params::owner,
    group => $godot::params::group,
  }

  if !( $ensure in [ present, running, stopped ] ) {
    fail('ensure parameter must be present, running or stopped')
  }

  include godot::install, godot::config, godot::service

}
