# This class is an internal class used by init.pp and should
# never be used or included directly.
class godot::config {

  require godot::install

  file { '/etc/init.d/godot':
    ensure  => file,
    content => template('godot/godot.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  file { "${godot::install_dir}/server":
    ensure => directory,
  }

  $content = $godot::server_js ? {
    undef => template('godot/server.js'),
    default => $godot::server_js
  }

  file { "${godot::install_dir}/server/server.js":
    ensure  => file,
    content => $content,
    notify  => Service['godot'],
  }

}