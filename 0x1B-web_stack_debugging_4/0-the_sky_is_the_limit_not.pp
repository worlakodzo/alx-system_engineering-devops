# This Puppet manifest configures the file descriptor limits for all users and Nginx.

# Configure system-wide file descriptor limits
file { '/etc/security/limits.conf':
  ensure  => file,
  content => "*          soft    nofile  65536\n*          hard    nofile  65536\n",
}

# Configure Nginx to handle more open file descriptors
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => "worker_rlimit_nofile 65536;

  events {
    worker_connections 8192;
  }

  http {
    # Other configurations...
  }\n",
}

# Ensure Nginx service is running and aware of the changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/security/limits.conf'],
  require   => File['/etc/security/limits.conf'],  # Redundant, service already subscribes
}
