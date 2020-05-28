class docker_run(
  $config
) {
  # Get default config if none provided to ensure proper type.
  if ( $config[docker_run] == undef ) {
    $containers = {}
  } else {
    $containers = $config[docker_run]
  }

  if ( ! empty( $config[disabled_extensions] ) and 'chassis/docker_run' in $config[disabled_extensions] ) {
    # Kill running containers and remove docker.
    $containers.each |String $container, Hash $settings| {
      docker::run { $container:
        ensure => 'absent'
      }
    }
    class { 'docker':
      ensure => 'absent'
    }
  } else {
    # Install docker and run containers.
    include 'docker'

    $containers.each |String $container, Hash $settings| {
      docker::run { $container:
        * => $settings
      }
    }
  }
}
