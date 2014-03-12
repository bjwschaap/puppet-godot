# This class is an internal class used by init.pp and should
# never be used or included directly.
class godot::service {

  require godot::config

  $ensure_service = $godot::ensure ? {
    'stopped' => 'stopped',
    default   => 'running'
  }

  service { 'godot':
    ensure => $ensure_service,
    enable => true,
  }

}