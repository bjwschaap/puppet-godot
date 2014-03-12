# This class is an internal class used by init.pp and should
# never be used or included directly.
class godot::install {

  # Set registry to plain http url
  npm_registry { 'http://registry.npmjs.org/': }

  # Install npm packages required by godot
  npm { [ 'graphite',
          'ip',
          'node-uuid',
          'redis',
          'sendgrid-web',
          'telenode',
          'utile',
          'window-stream',
          'backoff',
          'json-stream' ]:
    ensure    => present,
    path      => $godot::install_dir,
    proxy_url => $godot::proxy_url,
    require   => Extract[$godot::install_dir],
  }

  group { $godot::params::group:
    ensure => present,
  }

  user { $godot::params::owner:
    ensure => present,
    gid    => $godot::params::group,
  }

  extract { $godot::install_dir:
    archive   => $godot::archive,
    creates   => $godot::install_dir,
    owner     => $godot::params::owner,
    group     => $godot::params::group,
    proxy_url => $godot::proxy_url,
  }

  file { "${godot::install_dir}/logs":
    ensure  => directory,
    require => Extract[$godot::install_dir],
  }

}